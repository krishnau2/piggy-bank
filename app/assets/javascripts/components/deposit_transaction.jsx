class DepositTransaction extends React.Component {
  constructor(props){
    super(props);
    
    this.handleAmountChange = this.handleAmountChange.bind(this);
    this.handleAllocationChange = this.handleAllocationChange.bind(this);
    this.onFormSubmit = this.onFormSubmit.bind(this);
    this.wishlist = this.wishlist.bind(this);
    this.resetStateValue = this.resetStateValue.bind(this);
    this.calculateAllocationSum = this.calculateAllocationSum.bind(this);

    this.state = {
      depositAmount: '',
      goalAllocation: {},
      unallocatedAmount: 0,
      messageDisplay: false
    };
  }

  handleAmountChange(e) {
    let amount = e.target.value;
    let unallocatedAmount = 0;
    
    unallocatedAmount = amount - this.calculateAllocationSum(this.state.goalAllocation);
    this.setState(
      {[e.target.name]: amount,
        unallocatedAmount: unallocatedAmount,
      });
  }

  handleAllocationChange(key, val){
    let goalAllocation = {...this.state.goalAllocation};
    let unallocatedAmount = 0;
    
    goalAllocation[key] = val;    
    unallocatedAmount = this.state.depositAmount - this.calculateAllocationSum(goalAllocation);

    this.setState({goalAllocation: goalAllocation, unallocatedAmount: unallocatedAmount});
  }

  calculateAllocationSum(allocations){
    let allocationSum = 0;
    Object.keys(allocations).map(key => {
      if(allocations[key] !== ''){
        allocationSum += parseInt(allocations[key])
      }
    });
    return allocationSum;
  }
  
  wishlist(){
    wishlistItemComponent = this.props.wishlist.map((item) =>
      <WishlistItem
        key={item.id}
        item={item}
        value={this.state.goalAllocation[item.id]}
        selectedBank={this.props.selectedBank.name}
        handleAllocationChange={this.handleAllocationChange} />
    );
    return wishlistItemComponent
  }

  onFormSubmit(e){
    e.preventDefault();
    $.post('/deposits',
      {deposits: this.state,
        selected_bank_id: this.props.selectedBank.id
      }
    ).done(function(data){
      console.info("data", data);
      this.resetStateValue();
    }.bind(this)).fail(function(e){
      console.error("error")
    });
  }

  resetStateValue(){
    this.setState({
      depositAmount: 0,
      messageDisplay: true,
      unallocatedAmount: 0,
      goalAllocation: {}
    });
  }

  render() {
    return (
        <div>
          <Message display={this.state.messageDisplay} />
          <form onSubmit={this.onFormSubmit}>
            <div className="amount-container">
              <p>Amount you wish to keep in {this.props.selectedBank.name}</p>
              <input type="text"
                name="depositAmount" 
                value={this.state.depositAmount}
                placeholder="10000"
                onChange={this.handleAmountChange} 
                />            
            </div>
            <div className="allocation-message">
              <p>Allocate this amount to your Goals/Wishlists below</p>
              <p className="unallocated-msg">
                Unallocated amount: <span className="unallocated-amount">{this.state.unallocatedAmount}</span>
              </p>
            </div>
            <div className="wishlist-items-container">
              {this.wishlist()}
            </div>
            <div className="submit-button-container">
              <input type="submit" className="btn btn-outline-success btn-lg" value="SAVE" />
            </div>
          </form>
        </div>
      );
  }
}
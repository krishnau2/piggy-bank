class Transaction extends React.Component {
  constructor(props){
    super(props);
    
    this.handleOnchange = this.handleOnchange.bind(this);
    this.handleAllocationChange = this.handleAllocationChange.bind(this);
    this.onFormSubmit = this.onFormSubmit.bind(this);
    this.wishlist = this.wishlist.bind(this);
    this.goalsInitialState = this.goalsInitialState.bind(this);

    this.state = {
      depositAmount: 0,
      goalAllocation: this.goalsInitialState()
    };
  }

  goalsInitialState(){
    let goalState = {};
    this.props.wishlist.map((item)=>
      goalState[item.name] = 0
    );
    return goalState;
  }

  handleOnchange(e) {
    this.setState({[e.target.name]: e.target.value});
  }

  handleAllocationChange(key, val){
    let goalAllocation = {...this.state.goalAllocation}
    goalAllocation[key] = val
    this.setState({goalAllocation});
  }
  
  wishlist(){
    wishlistItemComponent = this.props.wishlist.map((item) =>
      <WishlistItem 
        item={item}
        value={this.state.goalAllocation[item.name]}
        handleAllocationChange={this.handleAllocationChange} />
    );
    return wishlistItemComponent
  }

  onFormSubmit(e){
    e.preventDefault();
    console.info('on Form submit.....');
    $.post('/deposits',
      {deposits: this.state}
    ).done(function(data){
      console.info(data);
    });
  }

  render() {
    return (
        <div>
          <form onSubmit={this.onFormSubmit}>
            <div className="amount-container">
              <p>Amount you wish to keep in {this.props.selectedBank.name}</p>
              <input type="text"
                name="depositAmount" 
                value={this.state.amount} 
                placeholder="10000"
                onChange={this.handleOnchange} 
                />            
            </div>
            <div className="allocation-message">
              <p>Allocate this amount to your Goals/Wishlists below</p>
              <p className="unallocated-msg">Unallocated amount: <span className="unallocated-amount">10000</span></p>
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
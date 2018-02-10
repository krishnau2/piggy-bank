class WishlistItem extends React.Component {
    constructor(props){
      super(props);
      this.handleOnchange = this.handleOnchange.bind(this);    
    }
  
    handleOnchange(e) {      
      // this.props.handleShareChange({[e.target.name]: e.target.value});
      this.props.handleAllocationChange(e.target.name, e.target.value);
    }
    
    render() {        
      return (          
        <div className="card wishlist-item" key={this.props.item.id}>
          <div className="card-body">
            <div className="card-title wishlist-item-title">{this.props.item.name}</div>
            <div className="card-text wishlist-item-details">
              <table>
                <tbody>
                  <tr>
                    <td>Goal:</td>
                    <td>{this.props.item.goal_amount}</td>
                  </tr>
                  <tr>
                    <td>Total:</td>
                    <td>25000</td>
                  </tr>
                  <tr>
                    <td>In HDFC:</td>
                    <td>10000</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div className="wishlist-item-input">
              <input type="text" 
                name={this.props.item.id}
                value={this.props.value}
                placeholder="Share..."
                onChange={this.handleOnchange}/>
            </div>
          </div>
        </div>
      );
    }
  }
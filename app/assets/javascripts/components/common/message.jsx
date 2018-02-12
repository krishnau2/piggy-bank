class Message extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            display: this.props.display
        }
        this.displayClass = this.displayClass.bind(this);
        this.close = this.close.bind(this);
    }
    displayClass(){
        if(this.state.display === true){
            return "message-container show";
        }else{
            return "message-container hide";
        }
    }

    close(){
        this.setState({display: false})
    }

    render() {
      return (
        <div className={this.displayClass()} >
            <div className="message-text">
              Saved succefully
            </div>
            <div className="message-close" onClick={this.close}>X</div>
        </div>
      );
    }
}
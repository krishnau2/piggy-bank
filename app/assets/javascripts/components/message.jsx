class Message extends React.Component {
    constructor(props){
        super(props);
        this.displayClass = this.displayClass.bind(this);
    }
    displayClass(){
        if(this.props.display === true){
            return "message-container show";
        }else{
            return "message-container hide";
        }
    }

    render() {
      return (
        <div className={this.displayClass()} >
          <p>Saved succefully</p>
        </div>
      );
    }
}
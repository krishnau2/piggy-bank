class Example extends React.Component {
  render() {
    let wishlistNames;

    wishlistNames = this.props.wishlist.map((item) =>
        <li key={item.id}>
          {item.name}({item.goal_amount})
          <input type="text" name={item.name} />
        </li>
      );

    return (
        <div>
          <h1>{this.props.title}</h1>
          <ul>{wishlistNames}</ul>
        </div>
      );
  }
}
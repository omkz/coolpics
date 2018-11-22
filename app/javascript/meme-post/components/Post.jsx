import React from "react";
import ReactDOM from "react-dom";

class Post extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editable: false
    };
  }

  render() {
    return (
      <div className={"col-lg-12 well"}>
        <h2>{this.props.post.title}</h2>
        <img src={this.props.post.image.standard.url} />
      </div>
    );
  }
}

export default Post;


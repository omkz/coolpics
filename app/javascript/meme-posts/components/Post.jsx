import React from "react";
import ReactDOM from "react-dom";

class Post extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h2>{this.props.post.title}</h2>
        <img
          src={this.props.post.image.url}
          className="img-responsive"
          border="0"
        />
      </div>
    );
  }
}

export default Post;

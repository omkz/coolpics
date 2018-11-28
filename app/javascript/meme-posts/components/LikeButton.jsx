import React from "react";

class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      liked: this.props.post.is_liked
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(id) {
    this.setState({
      liked: !this.state.liked
    });

    if (this.state.liked == true) {
      fetch(`api/v1/likes/${id}/unlike`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json"
        }
      });
    } else {
      fetch(`api/v1/likes/${id}/like`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json"
        }
      });
    }
  }

  render() {
    const label = this.state.liked ? "Liked" : "Like";
    const icon = this.state.liked ? " liked" : "";
    return (
      <React.Fragment>
        <button
          className= {"btn btn-info" + icon}
          onClick={() => this.handleClick(this.props.post.id)}
        >
          <i className= "fa fa-thumbs-up" /> {label}
        </button>
      </React.Fragment>
    );
  }
}

export default LikeButton;

import React from "react";

class LikeButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      liked: this.props.post.is_liked,
      score: parseInt(this.props.post.score)
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(id) {
    if (this.state.liked == true) {
      fetch(`api/v1/likes/${id}/unlike`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json"
        }
      })
        .then(response => {
          return response.json();
        })
        .then(post => {
          this.setState({
            liked: !this.state.liked,
            score: post.score
          });
        });
    } else {
      fetch(`api/v1/likes/${id}/like`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json"
        }
      })
        .then(response => {
          return response.json();
        })
        .then(post => {
          this.setState({
            liked: !this.state.liked,
            score: post.score
          });
        });
    }
  }

  render() {
    const label = this.state.liked ? "Liked" : "Like";
    const icon = this.state.liked ? " liked" : "";
    const score = this.state.score;

    var btn = this.props.post.user_signed_in ? 
    <a className={"btn btn-info" + icon} onClick={() => this.handleClick(this.props.post.id)}><i className="fa fa-thumbs-up" /> {label}</a> :
    <a className={"btn btn-info" + icon} onClick={() => (location.href = "/users/sign_in")}><i className="fa fa-thumbs-up" /> {label}</a>;

    return (
      <React.Fragment>
        <small className="point">
          <p> {score} point </p>
        </small>
        {btn}
        
      </React.Fragment>
    );
  }
}

export default LikeButton;

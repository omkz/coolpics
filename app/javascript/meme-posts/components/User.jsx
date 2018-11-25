import React from "react";
import ReactDOM from "react-dom";

class User extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <div className="media">
          <div className="media-left">
            <a href="#">
              <div className="square-image-50">
                <img src={this.props.post.user.avatar.thumb.url} />
              </div>
            </a>
          </div>
          <div className="media-body">
            <h4 className="media-heading">{this.props.post.user.username}</h4>
            <small>{this.props.post.created_at}</small>
          </div>
        </div>
      </div>
    );
  }
}

export default User;

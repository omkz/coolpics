import React from "react";
import ReactDOM from "react-dom";

class FooterLink extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
         <a href={ this.props.post.url} data-turbolinks="false" className="btn btn-info">comments</a>
         <a href={ "https://www.facebook.com/sharer/sharer.php?u=" + this.props.post.url } data-turbolinks="false" className="btn btn--fb">
           <i className="fa fa-facebook fa-fw"></i>Facebook
         </a>
         <a href={ "http://twitter.com/home?status=" + this.props.post.url } data-turbolinks="false" className="btn btn--twitter">
         <i className="fa fa-twitter fa-fw"></i>Twitter </a>
      </div>
    );
  }
}

export default FooterLink;


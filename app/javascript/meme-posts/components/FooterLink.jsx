import React from "react";
import ReactDOM from "react-dom";

class FooterLink extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
         <p><a href={ "posts/"+ this.props.post.id} data-turbolinks="false">comments</a></p>
         <p><a href={ "https://www.facebook.com/sharer/sharer.php?u=" + this.props.post.title } data-turbolinks="false">facebook</a></p>
         <p><a href={ "http://twitter.com/home?status=" + this.props.post.title } data-turbolinks="false">twitter</a></p>
      </div>
    );
  }
}

export default FooterLink;


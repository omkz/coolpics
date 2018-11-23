import React from "react";
import ReactDOM from "react-dom";
import Post from "./Post";
import FooterLink from "./FooterLink";

const AllPosts = props => {
  var posts = props.posts.map(post => {
    return (
      <div  className={"col-lg-12 well"} key={post.id}>
        <Post post={post} />
        <FooterLink post={post} />
      </div>
    );
  });

  return  <div>{posts}</div>;
};

export default AllPosts;

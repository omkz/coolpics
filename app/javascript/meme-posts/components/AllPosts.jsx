import React from "react";
import ReactDOM from "react-dom";
import Post from "./Post";
import User from "./User";
import FooterLink from "./FooterLink";
import LikeButton from "./LikeButton";

const AllPosts = props => {
  var posts = props.posts.map(post => {
    return (
      <div className={"col-lg-12 well"} key={post.id}>
        <User post={post} />
        <Post post={post} /> <br />
        <div className="btn-toolbar"> 
         <LikeButton post={post} /> 
         <FooterLink post={post} />
        </div>
      </div>
    );
  });

  return <div>{posts}</div>;
};

export default AllPosts;

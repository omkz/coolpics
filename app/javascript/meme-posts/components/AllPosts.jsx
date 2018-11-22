import React from "react";
import ReactDOM from "react-dom";
import Post from "./Post";

const AllPosts = props => {
  var posts = props.posts.map(post => {
    return (
      <div key={post.id}>
        <Post post={post} />
      </div>
    );
  });

  return <div>{posts}</div>;
};

export default AllPosts;

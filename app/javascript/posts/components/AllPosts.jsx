import React from "react";
import ReactDOM from "react-dom";

class AllPosts extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: []
    };
  }
  componentDidMount() {
    fetch("/api/v1/posts")
      .then(response => {
        return response.json();
      })
      .then(data => {
        this.setState({ posts: data });
      });
  }

  render() {
    var posts = this.state.posts.map(post => {
      return (
        <div className={"col-lg-12 well"} key={post.id}>
          <h1>{post.title}</h1>
          <p>
            <img src={post.image.standard.url} />
          </p>
        </div>
      );
    });
    return <div className="row">{posts}</div>;
  }
}

export default AllPosts;

import React from "react";
import ReactDOM from "react-dom";
import AllPosts from "./AllPosts";

class App extends React.Component {
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
        this.setState({
          posts: data
        });
      });
  }

  render() {
    return (
      <div>
        <AllPosts posts={this.state.posts} />
      </div>
    );
  }
}

export default App;

import './Blogs.css';

function Blogs() {
  const posts = [
    { date: 'April 16, 2021', readTime: '6 mins', title: 'Design tips for designers, that cover everything you need' },
    { date: 'April 16, 2021', readTime: '5 mins', title: 'How to build rapport with your web design clients' },
    { date: 'April 16, 2021', readTime: '5 mins', title: 'Top 6 free website mockup tools 2021' },
    { date: 'April 16, 2021', readTime: '7 mins', title: 'Logo design trends to avoid in 2021' },
    { date: 'April 16, 2021', readTime: '7 mins', title: '22 best UI design tools' },
  ];
 
  return (
    <section className="section section-dark" id="blogs">
      <div className="container">
        <div className="blogs-head">
          <div>
            <p className="eyebrow eyebrow-orange">Blogs</p>
            <h2 className="blogs-title">Latest Blogs</h2>
          </div>
          <a href="#" className="blogs-view-all">View all →</a>
        </div>

        <ul className="blogs-list">
          {posts.map((post, i) => (
            <li key={i}>
              <a href="#" className="blog-item">
                <span className="blog-meta">{post.date} · {post.readTime}</span>
                <div className="blog-content">
                  <h3>{post.title}</h3>
                  <span className="blog-link">Read the article →</span>
                </div>
              </a>
            </li>
          ))}
        </ul>
      </div>
    </section>
  );
}

export default Blogs;

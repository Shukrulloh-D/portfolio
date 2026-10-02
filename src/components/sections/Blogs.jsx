import { BLOGS } from 'data/content';
import styles from './Blogs.module.css';

export const Blogs = () => (
  <section className="section section--dark" id="blogs">
    <div className="container">
      <div className={styles.head}>
        <div>
          <div className="eyebrow eyebrow--orange">Blogs</div>
          <h2 className={styles.title}>{BLOGS.title}</h2>
        </div>
        <a href="#" className={styles.viewAll}>View all</a>
      </div>

      <ul className={styles.list}>
        {BLOGS.items.map((post, i) => (
          <li key={i}>
            <a href={post.href} className={styles.item}>
              <span className={styles.meta}>
                {post.date} · {post.readTime}
              </span>
              <div className={styles.content}>
                <h3 className={styles.itemTitle}>{post.title}</h3>
                <span className={styles.readMore}>Read the article</span>
              </div>
            </a>
          </li>
        ))}
      </ul>
    </div>
  </section>
);

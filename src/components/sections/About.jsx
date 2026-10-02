import { ABOUT } from 'data/content';
import styles from './About.module.css';

export const About = () => (
  <section className="section" id="about">
    <div className="container">
      <div className={styles.head}>
        <div>
          <div className="eyebrow eyebrow--orange">Product Designer</div>
          <h2 className={styles.title}>{ABOUT.title}</h2>
        </div>
        <p className={styles.description}>{ABOUT.description}</p>
      </div>

      <div className={styles.gallery}>
        {/* 🖼️ ЗАМЕНИ В src/data/content.js → ABOUT.photos */}
        {ABOUT.photos.map((src, i) => (
          <img key={i} src={src} alt="" />
        ))}
      </div>
    </div>
  </section>
);

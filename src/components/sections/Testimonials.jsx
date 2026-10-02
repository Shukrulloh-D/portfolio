import { useState } from 'react';
import { TESTIMONIALS } from 'data/content';
import styles from './Testimonials.module.css';

export const Testimonials = () => {
  const [index, setIndex] = useState(0);
  const item = TESTIMONIALS[index];

  const prev = () => setIndex((i) => (i - 1 + TESTIMONIALS.length) % TESTIMONIALS.length);
  const next = () => setIndex((i) => (i + 1) % TESTIMONIALS.length);

  return (
    <section className="section">
      <div className="container">
        <div className="eyebrow eyebrow--purple">Testimonials</div>
        <h2 className={styles.title}>Word on the street</h2>

        <div className={styles.wrap}>
          <div className={styles.photo}>
            {/* 🖼️ ЗАМЕНИ В src/data/content.js → TESTIMONIALS[].photo */}
            <img src={item.photo} alt={item.author} />
            <div className={styles.photoNav}>
              <button onClick={prev} aria-label="Previous">←</button>
              <button onClick={next} aria-label="Next">→</button>
            </div>
          </div>

          <div>
            <p className={styles.quote}>{item.quote}</p>
            <div className={styles.author}>
              <span className={styles.authorName}>{item.author}</span>
              <span className={styles.authorRole}>{item.role}</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

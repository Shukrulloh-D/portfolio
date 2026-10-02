import { useState } from 'react';
import { FAQ } from 'data/content';
import styles from './Faq.module.css';

export const Faq = () => {
  const [open, setOpen] = useState(null);
  const toggle = (i) => setOpen(open === i ? null : i);

  return (
    <section className="section section--dark">
      <div className="container">
        <div className="eyebrow eyebrow--orange">FAQ</div>
        <h2 className={styles.title}>{FAQ.title}</h2>

        <div className={styles.grid}>
          {FAQ.items.map((item, i) => (
            <div key={i} className={styles.item}>
              <button className={styles.header} onClick={() => toggle(i)}>
                <span>{item.q}</span>
                <span className={`${styles.icon} ${open === i ? styles['icon--open'] : ''}`}>⌄</span>
              </button>
              {open === i && <p className={styles.body}>{item.a}</p>}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

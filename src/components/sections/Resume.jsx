import { RESUME } from 'data/content';
import styles from './Resume.module.css';

const BADGE_EMOJI = { pink: '🚀', blue: '🎵', yellow: '👑' };

export const Resume = () => (
  <section className="section section--soft">
    <div className="container">
      <div className={styles.grid}>
        <div>
          <h3 className={styles.colTitle}>📚 Education</h3>
          {RESUME.education.map((item) => (
            <a key={item.place} href={item.href} className={styles.item}>
              <div>
                <div className={styles.place}>{item.place}</div>
                <div className={styles.degree}>{item.degree}</div>
              </div>
              <span className={styles.period}>{item.period}</span>
              <span className={styles.arrow}>↗</span>
            </a>
          ))}
        </div>

        <div>
          <h3 className={styles.colTitle}>💼 Work Experience</h3>
          {RESUME.experience.map((item) => (
            <a key={item.company} href={item.href} className={styles.item}>
              <div className={styles.itemMain}>
                <div className={`${styles.badge} ${styles[`badge--${item.accent}`]}`}>
                  {BADGE_EMOJI[item.accent]}
                </div>
                <div>
                  <div className={styles.place}>{item.company}</div>
                  <div className={styles.degree}>{item.role}</div>
                </div>
              </div>
              <span className={styles.period}>{item.period}</span>
              <span className={styles.arrow}>↗</span>
            </a>
          ))}
        </div>
      </div>
    </div>
  </section>
);

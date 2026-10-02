import { PROJECTS } from 'data/content';
import styles from './Projects.module.css';

export const Projects = () => (
  <section className="section" id="projects">
    <div className="container">
      <div className={styles.head}>
        <div>
          <div className="eyebrow eyebrow--purple">Projects</div>
          <h2 className={styles.title}>{PROJECTS.title}</h2>
        </div>
        <a href="#" className={styles.viewAll}>View all projects</a>
      </div>

      <div className={styles.grid}>
        {PROJECTS.items.map((item) => (
          <a key={item.title} href={item.href} className={styles.card}>
            {/* 🖼️ ЗАМЕНИ В src/data/content.js → PROJECTS.items[].image */}
            <img src={item.image} alt={item.title} />
            <div>
              <span className={styles.cardTag}>{item.tag}</span>
              <h3 className={styles.cardTitle}>{item.title}</h3>
              <span className={styles.cardLink}>View Project</span>
            </div>
          </a>
        ))}
      </div>
    </div>
  </section>
);

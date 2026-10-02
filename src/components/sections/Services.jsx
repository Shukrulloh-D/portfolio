import { SERVICES } from 'data/content';
import styles from './Services.module.css';

export const Services = () => (
  <section className="section section--soft" id="services">
    <div className="container">
      <div className="eyebrow eyebrow--orange">Services</div>
      <h2 className="section-title section-title--center">{SERVICES.title}</h2>

      <div className={styles.columns}>
        {SERVICES.columns.map((col) => (
          <div key={col.title}>
            <h3 className={styles.colTitle}>{col.title}</h3>
            <p className={styles.colDescription}>{col.description}</p>
            <ul className={styles.list}>
              {col.items.map((item) => (
                <li key={item} className={styles.listItem}>{item}</li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </div>
  </section>
);

import { FOOTER } from 'data/content';
import styles from './Footer.module.css';

export const Footer = () => (
  <footer className={styles.footer} id="footer">
    <div className="container">
      <div className={styles.top}>
        <h2 className={styles.title}>{FOOTER.title}</h2>
        <p className={styles.accent}>{FOOTER.accent}</p>
      </div>

      <div className={styles.middle}>
        <div>
          <div className={styles.brand}>{FOOTER.brand}</div>
          <p className={styles.address}>{FOOTER.address}</p>
          <p className={styles.email}>✉ {FOOTER.email}</p>
        </div>

        {FOOTER.columns.map((col) => (
          <div key={col.title}>
            <div className={styles.colTitle}>{col.title}</div>
            {col.links.map((link) => (
              <a key={link} href="#" className={styles.colLink}>{link}</a>
            ))}
          </div>
        ))}
      </div>

      <div className={styles.bottom}>
        <span>{FOOTER.copyright}</span>
        <div className={styles.metaLinks}>
          {FOOTER.metaLinks.map((m) => (
            <a key={m} href="#">{m}</a>
          ))}
        </div>
      </div>
    </div>
  </footer>
);

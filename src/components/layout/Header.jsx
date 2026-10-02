import { NAV_LINKS } from 'data/content';
import styles from './Header.module.css';

export const Header = () => (
  <header className={styles.header}>
    <div className={`container ${styles.inner}`}>
      <a href="#" className={styles.logo}>
        Portfolio Creator<span className={styles.dot}>.</span>
      </a>

      <nav className={styles.nav}>
        {NAV_LINKS.map((link) => (
          <a key={link.label} href={link.href}>{link.label}</a>
        ))}
      </nav>

      <a href="#footer" className={styles.cta}>
        Book a call <span className={styles.arrow}>→</span>
      </a>
    </div>
  </header>
);

import styles from './Button.module.css';

/**
 * Универсальная кнопка.
 * variant="primary" — чёрная заливка
 * variant="ghost"   — прозрачная с текстом и стрелкой
 */
export const Button = ({ children, href = '#', variant = 'primary', className = '', ...rest }) => (
  <a
    href={href}
    className={`${styles.btn} ${styles[`btn--${variant}`]} ${className}`}
    {...rest}
  >
    {children}
    {variant === 'ghost' && <span className={styles.arrow}>→</span>}
  </a>
);

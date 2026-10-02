import styles from './Button.module.css';

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
 
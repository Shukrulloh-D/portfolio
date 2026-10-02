import { HERO } from 'data/content';
import { Button } from 'components/ui/Button';
import styles from './Hero.module.css';

export const Hero = () => (
  <section className={styles.hero}>
    <div className="container">
      <div className={styles.grid}>
        <div>
          <h1 className={styles.title}>
            {HERO.title.map((line, i) => (
              <span key={i} className={line.accent ? styles.accent : ''}>
                {line.text}
                {i < HERO.title.length - 1 && <br />}
              </span>
            ))}
          </h1>

          <p className={styles.subtitle}>{HERO.subtitle}</p>

          <div className={styles.actions}>
            <Button href={HERO.primaryCta.href} variant="primary">
              {HERO.primaryCta.label}
            </Button>
            <Button href={HERO.secondaryCta.href} variant="ghost">
              {HERO.secondaryCta.label}
            </Button>
          </div>
        </div>

        <div className={styles.photo}>
          {/* 🖼️ ЗАМЕНИ ФОТО В src/data/content.js → HERO.photo */}
          <img src={HERO.photo} alt="Jake, product designer" />
        </div>
      </div>

      <div className={styles.trusted}>
        <span className={styles.trustedLabel}>Trusted by</span>
        <div className={styles.trustedList}>
          {HERO.trustedLogos.map((name, i) => (
            <span key={i} className={styles.trustedLogo}>{name}</span>
          ))}
        </div>
      </div>
    </div>
  </section>
);

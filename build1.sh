#!/bin/bash

# ============================================================
# PORTFOLIO CREATOR — полная структура проекта
# ============================================================

mkdir -p public/images
mkdir -p src/app/styles
mkdir -p src/components/layout
mkdir -p src/components/sections
mkdir -p src/components/ui
mkdir -p src/data

# ---------- index.html ----------
cat > index.html << 'END'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Product designer based in Berlin." />
    <title>Portfolio Creator — Jake, Product Designer</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
END

cat > public/favicon.svg << 'END'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <rect width="32" height="32" rx="6" fill="#111111"/>
  <text x="16" y="22" font-family="Inter, sans-serif" font-size="18" font-weight="800" fill="#FF7051" text-anchor="middle">J</text>
</svg>
END

cat > vite.config.js << 'END'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { fileURLToPath, URL } from 'node:url';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
      'app': fileURLToPath(new URL('./src/app', import.meta.url)),
      'components': fileURLToPath(new URL('./src/components', import.meta.url)),
      'data': fileURLToPath(new URL('./src/data', import.meta.url)),
    },
  },
});
END

cat > jsconfig.json << 'END'
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "app/*": ["src/app/*"],
      "components/*": ["src/components/*"],
      "data/*": ["src/data/*"]
    }
  },
  "include": ["src/**/*"]
}
END

# ---------- STYLES ----------
cat > src/app/styles/reset.css << 'END'
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; }
body { -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; }
img, picture, svg { display: block; max-width: 100%; }
button, input, textarea, select { font: inherit; color: inherit; }
button { cursor: pointer; border: none; background: none; }
a { color: inherit; text-decoration: none; }
ul, ol { list-style: none; }
END

cat > src/app/styles/variables.css << 'END'
:root {
  --color-text: #0F0F0F;
  --color-text-muted: #6B6B6B;
  --color-text-light: #999999;
  --color-bg: #FFFFFF;
  --color-bg-dark: #111111;
  --color-bg-soft: #F5F5F5;
  --color-border: #EAEAEA;
  --color-accent-orange: #FF7051;
  --color-accent-purple: #5B4EE8;

  --font-main: 'Inter', system-ui, -apple-system, sans-serif;

  --container: 1200px;
  --radius-sm: 6px;
  --radius: 12px;
  --radius-lg: 20px;

  --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.04);
  --shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
  --transition: 0.2s ease;
}
END

cat > src/app/styles/global.css << 'END'
@import './reset.css';
@import './variables.css';

body {
  font-family: var(--font-main);
  font-size: 16px;
  line-height: 1.5;
  color: var(--color-text);
  background: var(--color-bg);
}

.container {
  max-width: var(--container);
  margin: 0 auto;
  padding: 0 24px;
}

.eyebrow {
  display: inline-block;
  font-size: 13px;
  font-weight: 700;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  margin-bottom: 16px;
}
.eyebrow--orange { color: var(--color-accent-orange); }
.eyebrow--purple { color: var(--color-accent-purple); }

.section-title {
  font-size: 48px;
  font-weight: 900;
  line-height: 1.1;
  letter-spacing: -0.02em;
  margin-bottom: 40px;
}
.section-title--center { text-align: center; }

.section { padding: 100px 0; }
.section--dark { background: var(--color-bg-dark); color: #FFFFFF; }
.section--soft { background: var(--color-bg-soft); }

@media (max-width: 900px) {
  .section { padding: 60px 0; }
  .section-title { font-size: 32px; }
}
END

# ---------- MAIN + APP ----------
cat > src/main.jsx << 'END'
import React from 'react';
import ReactDOM from 'react-dom/client';
import { App } from 'app/App';
import 'app/styles/global.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
END

cat > src/app/App.jsx << 'END'
import { Header } from 'components/layout/Header';
import { Footer } from 'components/layout/Footer';
import { Hero } from 'components/sections/Hero';
import { Services } from 'components/sections/Services';
import { Projects } from 'components/sections/Projects';
import { Blogs } from 'components/sections/Blogs';
import { About } from 'components/sections/About';
import { Resume } from 'components/sections/Resume';
import { Testimonials } from 'components/sections/Testimonials';
import { Faq } from 'components/sections/Faq';

/**
 * App — корневой компонент.
 * Только композиция секций в нужном порядке.
 * Никакой логики — за неё отвечают сами секции.
 */
export const App = () => (
  <>
    <Header />
    <main>
      <Hero />
      <Services />
      <Projects />
      <Blogs />
      <About />
      <Resume />
      <Testimonials />
      <Faq />
    </main>
    <Footer />
  </>
);
END

# ---------- DATA ----------
cat > src/data/content.js << 'END'
/**
 * ЕДИНЫЙ ФАЙЛ С КОНТЕНТОМ
 * Все тексты, ссылки и картинки проекта.
 * Меняешь здесь — обновляется везде.
 *
 * 🖼️ КАРТИНКИ: свои кладёшь в public/images/ и пишешь '/images/файл.png'
 */

export const NAV_LINKS = [
  { label: 'About',    href: '#about' },
  { label: 'Services', href: '#services' },
  { label: 'Projects', href: '#projects' },
  { label: 'Blog',     href: '#blogs' },
];

export const HERO = {
  title: [
    { text: 'I design products', accent: true },
    { text: 'that delight and',  accent: false },
    { text: 'inspire people.',   accent: false },
  ],
  subtitle: "Hi! I'm Jake, a product designer based in Berlin. I create user-friendly interfaces for fast-growing startups.",
  photo: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500',
  primaryCta:   { label: 'Book a call',  href: '#footer' },
  secondaryCta: { label: 'Download CV', href: '#' },
  trustedLogos: ['logoipsum', 'logoipsum', 'LOGOIPSUM', 'logoipsum'],
};

export const SERVICES = {
  title: 'Design that solves problems, one product at a time.',
  columns: [
    {
      title: 'What I can do for you',
      description: "Faster, better products that your users love. Here's all the services I provide:",
      items: ['Design Strategy', 'Web and Mobile App Design', 'Front-end Development'],
    },
    {
      title: "Applications I'm fluent in",
      description: "Every designer needs the right tools to do the perfect job. Thankfully, I'm multilingual.",
      items: ['Sketch', 'Webflow', 'Figma'],
    },
    {
      title: 'What you can expect',
      description: 'I design products that are more than pretty. I make them shippable and usable.',
      items: ['Clean and functional', 'Device and user friendly', 'Efficient and maintainable'],
    },
  ],
};

export const PROJECTS = {
  title: 'I bring results.\nMy clients are proof.',
  items: [
    { tag: 'Branding',       title: 'Soulful Rebrand',         image: 'https://images.unsplash.com/photo-1558655146-9f40138edfeb?w=500', href: '#' },
    { tag: 'Product Design', title: 'Datadash Product design', image: 'https://images.unsplash.com/photo-1618761714954-0b8cd0026356?w=500', href: '#' },
    { tag: 'Web Design',     title: 'Maize Website Design',    image: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=500', href: '#' },
  ],
};

export const BLOGS = {
  title: 'Latest Blogs',
  items: [
    { date: 'April 16, 2021', readTime: '6 mins', title: 'Design tips for designers, that cover everything you need', href: '#' },
    { date: 'April 16, 2021', readTime: '5 mins', title: 'How to build rapport with your web design clients',          href: '#' },
    { date: 'April 16, 2021', readTime: '5 mins', title: 'Top 6 free website mockup tools 2021',                        href: '#' },
    { date: 'April 16, 2021', readTime: '7 mins', title: 'Logo design trends to avoid in 2021',                          href: '#' },
    { date: 'April 16, 2021', readTime: '7 mins', title: '22 best UI design tools',                                      href: '#' },
  ],
};

export const ABOUT = {
  title: "That's me!",
  description: "Over the past 12 years, I've worked with a diverse range of clients, from startups to Fortune 500 companies. I love crafting interfaces that delight users and help businesses grow.",
  photos: [
    'https://images.unsplash.com/photo-1618477247222-acbdb0e159b3?w=400',
    'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=600',
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600',
    'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=600',
  ],
};

export const RESUME = {
  education: [
    { place: 'Stanford University',         degree: 'MSc (Human Computer Interaction)', period: '2013-2015', href: '#' },
    { place: 'MIT Summer School',           degree: 'UX Training Bootcamp',            period: '2013-2014', href: '#' },
    { place: 'California State University', degree: 'BSc in Software Engineering',     period: '2009-2012', href: '#' },
  ],
  experience: [
    { company: 'SpaceFleet', role: 'Senior Product Designer', period: 'April 2019 - Current',  href: '#', accent: 'pink' },
    { company: 'MusicMash',  role: 'Information Architect',   period: 'April 2016 - May 2017', href: '#', accent: 'blue' },
    { company: 'Kingdom',    role: 'UI Designer',             period: 'April 2016 - May 2017', href: '#', accent: 'yellow' },
  ],
};

export const TESTIMONIALS = [
  {
    quote: "Jade helped us build a software so intuitive that it didn't need a walkthrough. He solved complex problems with brilliant design.",
    author: 'John Franklin',
    role: 'Founder, Double Bunch',
    photo: 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=500',
  },
  {
    quote: 'Working with Jake was a game-changer. He took our vague ideas and turned them into a design system we still use today.',
    author: 'Maria Lopez',
    role: 'Product Lead, Nova',
    photo: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500',
  },
];

export const FAQ = {
  title: 'Frequently asked questions',
  items: [
    { q: 'What type of projects do you take on?',              a: 'Mostly product design for SaaS, mobile apps and design systems.' },
    { q: 'How do you charge for projects?',                    a: 'Fixed price per project or monthly retainer — depends on scope.' },
    { q: 'What is your hourly rate?',                          a: '$80/hour for freelance, discounted for long-term contracts.' },
    { q: 'What does your design process look like?',           a: 'Research, wireframes, high-fidelity UI, prototype, handoff.' },
    { q: 'What time-zone do you work in?',                     a: 'CET (Berlin). I overlap 4+ hours with US East Coast.' },
    { q: 'What metrics do you use to measure success?',        a: 'Conversion, retention, task success rate and NPS.' },
    { q: 'What is the typical timeline for a project?',        a: '2–8 weeks depending on the scope of work.' },
    { q: 'What if I need help after the project is complete?', a: 'You get 30 days of free support after the handoff.' },
  ],
};

export const FOOTER = {
  title: 'Ready to make something kickass?',
  accent: "Let's get on a call.",
  brand: 'Portfolio Creator.',
  address: '4351 Delaware Avenue, San Francisco, USA',
  email: 'hi@thefolio.com',
  columns: [
    { title: 'About',      links: ['About', 'Contact', 'Dribbble'] },
    { title: 'Services',   links: ['Services', 'Blog', 'Instagram'] },
    { title: 'Experience', links: ['Experience', 'Projects', 'Twitter'] },
  ],
  copyright: '© All rights reserved. Sumit Hegde',
  metaLinks: ['Powered by Webflow', 'Image License Info', 'Instructions', 'Changelog', 'Style Guide'],
};
END

# ---------- UI: Button ----------
cat > src/components/ui/Button.module.css << 'END'
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  padding: 16px 28px;
  border-radius: var(--radius-sm);
  font-weight: 600;
  font-size: 15px;
  transition: all var(--transition);
  white-space: nowrap;
}
.btn--primary { background: var(--color-text); color: #FFFFFF; }
.btn--primary:hover { background: #2A2A2A; transform: translateY(-1px); }
.btn--ghost { background: transparent; color: var(--color-text); padding: 16px 0; }
.btn--ghost:hover { color: var(--color-accent-orange); }
.arrow { transition: transform var(--transition); }
.btn--ghost:hover .arrow { transform: translateX(4px); }
END

cat > src/components/ui/Button.jsx << 'END'
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
END

# ---------- LAYOUT: Header ----------
cat > src/components/layout/Header.module.css << 'END'
.header {
  position: sticky;
  top: 0;
  z-index: 100;
  background: #FFFFFF;
  border-bottom: 1px solid var(--color-border);
}

.inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 72px;
  gap: 40px;
}

.logo {
  font-size: 20px;
  font-weight: 800;
  letter-spacing: -0.02em;
}
.logo .dot { color: var(--color-accent-orange); }

.nav {
  display: flex;
  gap: 36px;
  font-size: 15px;
  font-weight: 500;
}
.nav a {
  color: var(--color-text);
  transition: color var(--transition);
}
.nav a:hover { color: var(--color-accent-orange); }

.cta {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  font-size: 15px;
  font-weight: 600;
}
.cta .arrow { transition: transform var(--transition); }
.cta:hover .arrow { transform: translateX(4px); }

@media (max-width: 700px) {
  .nav { display: none; }
}
END

cat > src/components/layout/Header.jsx << 'END'
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
END

# ---------- SECTION: Hero ----------
cat > src/components/sections/Hero.module.css << 'END'
.hero { padding: 100px 0 60px; }

.grid {
  display: grid;
  grid-template-columns: 1.1fr 1fr;
  gap: 80px;
  align-items: center;
}

.title {
  font-size: 72px;
  font-weight: 900;
  line-height: 1.05;
  letter-spacing: -0.03em;
  margin-bottom: 32px;
}
.title .accent { color: var(--color-accent-orange); }

.subtitle {
  font-size: 18px;
  color: var(--color-text-muted);
  line-height: 1.55;
  margin-bottom: 40px;
  max-width: 520px;
}

.actions {
  display: flex;
  align-items: center;
  gap: 32px;
  flex-wrap: wrap;
}

.photo {
  display: flex;
  justify-content: flex-end;
}
.photo img {
  width: 100%;
  max-width: 500px;
  aspect-ratio: 5 / 6;
  object-fit: cover;
  filter: grayscale(100%);
  border-radius: var(--radius);
}

/* Trusted logos */
.trusted {
  margin-top: 100px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}
.trustedLabel {
  font-size: 14px;
  color: var(--color-text-muted);
}
.trustedList {
  display: flex;
  gap: 60px;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}
.trustedLogo {
  font-size: 20px;
  font-weight: 700;
  color: var(--color-text);
  opacity: 0.55;
  letter-spacing: 0.02em;
}

@media (max-width: 900px) {
  .grid { grid-template-columns: 1fr; gap: 40px; }
  .title { font-size: 44px; }
  .photo { justify-content: center; }
  .trustedList { gap: 32px; }
  .trustedLogo { font-size: 16px; }
}
END

cat > src/components/sections/Hero.jsx << 'END'
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
END

# ---------- SECTION: Services ----------
cat > src/components/sections/Services.module.css << 'END'
.columns {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 60px;
  border-top: 1px solid var(--color-border);
  padding-top: 60px;
}

.colTitle {
  font-size: 22px;
  font-weight: 800;
  margin-bottom: 16px;
}

.colDescription {
  font-size: 15px;
  color: var(--color-text-muted);
  line-height: 1.6;
  margin-bottom: 28px;
  min-height: 72px;
}

.list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.listItem {
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 15px;
  font-weight: 500;
}
.listItem::before {
  content: '';
  display: inline-block;
  width: 6px;
  height: 6px;
  background: var(--color-text);
  border-radius: 1px;
  flex-shrink: 0;
}

@media (max-width: 900px) {
  .columns { grid-template-columns: 1fr; gap: 40px; }
}
END

cat > src/components/sections/Services.jsx << 'END'
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
END

# ---------- SECTION: Projects ----------
cat > src/components/sections/Projects.module.css << 'END'
.head {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  margin-bottom: 60px;
  gap: 24px;
}
.title {
  font-size: 48px;
  font-weight: 900;
  line-height: 1.1;
  letter-spacing: -0.02em;
  white-space: pre-line;
}

.viewAll {
  display: inline-flex;
  align-items: center;
  padding: 14px 24px;
  background: var(--color-text);
  color: #FFFFFF;
  border-radius: var(--radius-sm);
  font-size: 14px;
  font-weight: 600;
  transition: background var(--transition);
}
.viewAll:hover { background: #2A2A2A; }

.grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
}

.card {
  display: flex;
  flex-direction: column;
  gap: 20px;
  cursor: pointer;
}
.card img {
  width: 100%;
  aspect-ratio: 3 / 2;
  object-fit: cover;
  border-radius: var(--radius);
  transition: transform 0.4s ease;
}
.card:hover img { transform: scale(1.03); }

.cardTag {
  display: inline-block;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--color-accent-purple);
  margin-bottom: 8px;
}
.cardTitle {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 12px;
}
.cardLink {
  font-size: 14px;
  font-weight: 600;
  color: var(--color-text);
  display: inline-flex;
  align-items: center;
  gap: 6px;
}
.cardLink::after { content: '→'; }

@media (max-width: 900px) {
  .grid { grid-template-columns: 1fr; }
  .head { flex-direction: column; align-items: flex-start; }
  .title { font-size: 32px; }
}
END

cat > src/components/sections/Projects.jsx << 'END'
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
END

# ---------- SECTION: Blogs ----------
cat > src/components/sections/Blogs.module.css << 'END'
.head {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  margin-bottom: 60px;
  gap: 24px;
}
.title {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -0.02em;
  margin-top: 8px;
}
.viewAll {
  font-size: 14px;
  font-weight: 600;
  display: inline-flex;
  align-items: center;
  gap: 6px;
}
.viewAll::after { content: '→'; }

.list {
  display: flex;
  flex-direction: column;
}
.item {
  display: grid;
  grid-template-columns: 200px 1fr;
  gap: 40px;
  padding: 32px 0;
  border-top: 1px solid rgba(255, 255, 255, 0.12);
  align-items: flex-start;
  transition: opacity var(--transition);
}
.item:hover { opacity: 0.75; }
.item:last-child { border-bottom: 1px solid rgba(255, 255, 255, 0.12); }

.meta {
  font-size: 13px;
  color: #999999;
  letter-spacing: 0.02em;
}

.content {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.itemTitle {
  font-size: 20px;
  font-weight: 700;
  line-height: 1.35;
  color: #FFFFFF;
}
.readMore {
  font-size: 13px;
  font-weight: 600;
  color: #FFFFFF;
  display: inline-flex;
  align-items: center;
  gap: 6px;
}
.readMore::after { content: '→'; }

@media (max-width: 700px) {
  .item { grid-template-columns: 1fr; gap: 12px; }
  .title { font-size: 28px; }
}
END

cat > src/components/sections/Blogs.jsx << 'END'
import { BLOGS } from 'data/content';
import styles from './Blogs.module.css';

export const Blogs = () => (
  <section className="section section--dark" id="blogs">
    <div className="container">
      <div className={styles.head}>
        <div>
          <div className="eyebrow eyebrow--orange">Blogs</div>
          <h2 className={styles.title}>{BLOGS.title}</h2>
        </div>
        <a href="#" className={styles.viewAll}>View all</a>
      </div>

      <ul className={styles.list}>
        {BLOGS.items.map((post, i) => (
          <li key={i}>
            <a href={post.href} className={styles.item}>
              <span className={styles.meta}>
                {post.date} · {post.readTime}
              </span>
              <div className={styles.content}>
                <h3 className={styles.itemTitle}>{post.title}</h3>
                <span className={styles.readMore}>Read the article</span>
              </div>
            </a>
          </li>
        ))}
      </ul>
    </div>
  </section>
);
END

# ---------- SECTION: About ----------
cat > src/components/sections/About.module.css << 'END'
.head {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 60px;
  align-items: start;
  margin-bottom: 60px;
}
.title {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -0.02em;
  margin-top: 8px;
}
.description {
  font-size: 16px;
  color: var(--color-text-muted);
  line-height: 1.7;
  padding-top: 32px;
}

.gallery {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}
.gallery img {
  width: 100%;
  aspect-ratio: 4 / 5;
  object-fit: cover;
  border-radius: var(--radius);
}
.gallery img:nth-child(1) { grid-column: 1; grid-row: 1 / 3; aspect-ratio: 4 / 11; }
.gallery img:nth-child(2) { grid-column: 2; }
.gallery img:nth-child(3) { grid-column: 3; }
.gallery img:nth-child(4) { grid-column: 2 / 4; aspect-ratio: auto; }

@media (max-width: 900px) {
  .head { grid-template-columns: 1fr; gap: 24px; }
  .title { font-size: 28px; }
  .gallery { grid-template-columns: 1fr; }
  .gallery img,
  .gallery img:nth-child(1),
  .gallery img:nth-child(2),
  .gallery img:nth-child(3),
  .gallery img:nth-child(4) { grid-column: auto; grid-row: auto; aspect-ratio: 4/3; }
}
END

cat > src/components/sections/About.jsx << 'END'
import { ABOUT } from 'data/content';
import styles from './About.module.css';

export const About = () => (
  <section className="section" id="about">
    <div className="container">
      <div className={styles.head}>
        <div>
          <div className="eyebrow eyebrow--orange">Product Designer</div>
          <h2 className={styles.title}>{ABOUT.title}</h2>
        </div>
        <p className={styles.description}>{ABOUT.description}</p>
      </div>

      <div className={styles.gallery}>
        {/* 🖼️ ЗАМЕНИ В src/data/content.js → ABOUT.photos */}
        {ABOUT.photos.map((src, i) => (
          <img key={i} src={src} alt="" />
        ))}
      </div>
    </div>
  </section>
);
END

# ---------- SECTION: Resume ----------
cat > src/components/sections/Resume.module.css << 'END'
.grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
}

.colTitle {
  font-size: 32px;
  font-weight: 800;
  margin-bottom: 32px;
  display: flex;
  align-items: center;
  gap: 12px;
}

.item {
  display: grid;
  grid-template-columns: 1fr auto auto;
  gap: 20px;
  align-items: center;
  padding: 24px 0;
  border-bottom: 1px solid var(--color-border);
  transition: opacity var(--transition);
}
.item:hover { opacity: 0.7; }
.item:hover .arrow { transform: translate(4px, -4px); }

.itemMain { display: flex; align-items: center; gap: 16px; }
.badge {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  flex-shrink: 0;
}
.badge--pink   { background: #FFE0EC; }
.badge--blue   { background: #E0EAFF; }
.badge--yellow { background: #FFF4CC; }

.place { font-size: 18px; font-weight: 700; }
.degree { font-size: 14px; color: var(--color-text-muted); margin-top: 4px; }
.period { font-size: 14px; color: var(--color-text-muted); }
.arrow { transition: transform var(--transition); }

@media (max-width: 900px) {
  .grid { grid-template-columns: 1fr; gap: 40px; }
  .colTitle { font-size: 24px; }
  .item { grid-template-columns: 1fr auto; }
  .period { grid-column: 1 / -1; }
}
END

cat > src/components/sections/Resume.jsx << 'END'
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
END

# ---------- SECTION: Testimonials ----------
cat > src/components/sections/Testimonials.module.css << 'END'
.title {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -0.02em;
  margin-bottom: 60px;
  margin-top: 8px;
}

.wrap {
  display: grid;
  grid-template-columns: 400px 1fr;
  gap: 80px;
  align-items: center;
}

.photo {
  position: relative;
}
.photo img {
  width: 100%;
  aspect-ratio: 1;
  object-fit: cover;
  border-radius: var(--radius);
}
.photoNav {
  position: absolute;
  bottom: 20px;
  right: 20px;
  display: flex;
  background: var(--color-text);
  border-radius: var(--radius-sm);
  overflow: hidden;
}
.photoNav button {
  width: 44px;
  height: 44px;
  color: #FFFFFF;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  transition: background var(--transition);
}
.photoNav button:hover { background: #2A2A2A; }

.quote {
  font-size: 26px;
  font-weight: 500;
  line-height: 1.5;
  margin-bottom: 40px;
  position: relative;
}
.quote::before {
  content: '❝';
  position: absolute;
  left: -60px;
  top: -10px;
  font-size: 48px;
  color: var(--color-accent-orange);
  line-height: 1;
}

.author { display: flex; flex-direction: column; gap: 4px; }
.authorName { font-weight: 700; font-size: 16px; }
.authorRole { font-size: 14px; color: var(--color-text-muted); }

@media (max-width: 900px) {
  .wrap { grid-template-columns: 1fr; gap: 40px; }
  .title { font-size: 28px; margin-bottom: 32px; }
  .quote { font-size: 20px; padding-left: 40px; }
  .quote::before { left: 0; }
}
END

cat > src/components/sections/Testimonials.jsx << 'END'
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
END

# ---------- SECTION: Faq ----------
cat > src/components/sections/Faq.module.css << 'END'
.title {
  font-size: 40px;
  font-weight: 900;
  text-align: center;
  letter-spacing: -0.02em;
  margin-bottom: 60px;
  margin-top: 8px;
}

.grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 0 60px;
}

.item {
  border-bottom: 1px solid rgba(255, 255, 255, 0.15);
}
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  padding: 24px 0;
  font-size: 17px;
  font-weight: 600;
  color: #FFFFFF;
  text-align: left;
  gap: 20px;
}
.icon {
  font-size: 20px;
  color: #FFFFFF;
  transition: transform var(--transition);
  flex-shrink: 0;
}
.icon--open { transform: rotate(180deg); }

.body {
  padding-bottom: 24px;
  font-size: 15px;
  line-height: 1.6;
  color: #AAAAAA;
}

@media (max-width: 900px) {
  .grid { grid-template-columns: 1fr; gap: 0; }
  .title { font-size: 28px; margin-bottom: 32px; }
}
END

cat > src/components/sections/Faq.jsx << 'END'
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
END

# ---------- LAYOUT: Footer ----------
cat > src/components/layout/Footer.module.css << 'END'
.footer {
  background: var(--color-bg-dark);
  color: #FFFFFF;
  padding: 100px 0 40px;
}

.top { margin-bottom: 80px; }
.title {
  font-size: 48px;
  font-weight: 900;
  line-height: 1.1;
  letter-spacing: -0.02em;
  margin-bottom: 12px;
}
.accent {
  color: var(--color-accent-purple);
  font-size: 48px;
  font-weight: 900;
  letter-spacing: -0.02em;
}

.middle {
  display: grid;
  grid-template-columns: 1.5fr 1fr 1fr 1fr;
  gap: 60px;
  padding: 60px 0;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.brand {
  font-size: 20px;
  font-weight: 800;
  margin-bottom: 20px;
}
.address, .email {
  font-size: 14px;
  color: #AAAAAA;
  margin-bottom: 12px;
  line-height: 1.6;
}

.colTitle {
  font-size: 14px;
  font-weight: 700;
  margin-bottom: 20px;
}
.colLink {
  display: block;
  font-size: 14px;
  color: #AAAAAA;
  margin-bottom: 12px;
  transition: color var(--transition);
}
.colLink:hover { color: #FFFFFF; }

.bottom {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
  padding-top: 32px;
  font-size: 13px;
  color: #777777;
}
.metaLinks { display: flex; gap: 24px; flex-wrap: wrap; }
.metaLinks a:hover { color: #FFFFFF; }

@media (max-width: 900px) {
  .title, .accent { font-size: 28px; }
  .middle { grid-template-columns: 1fr 1fr; gap: 32px; }
  .bottom { flex-direction: column; }
}
END

cat > src/components/layout/Footer.jsx << 'END'
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
END

echo ""
echo "═══════════════════════════════════════════"
echo "✅ ГОТОВО"
echo "═══════════════════════════════════════════"
echo ""
echo "Запускай: npm run dev"
echo ""

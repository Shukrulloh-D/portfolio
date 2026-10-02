#!/bin/bash

# ============================================================
# PORTFOLIO CREATOR - структура проекта
# ============================================================

mkdir -p public/images
mkdir -p src/app/styles
mkdir -p src/components/layout
mkdir -p src/components/sections
mkdir -p src/components/ui
mkdir -p src/data

# ============================================================
# 1. ROOT FILES
# ============================================================

cat > index.html << 'END'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Product designer based in Berlin. I craft interfaces that delight users and help businesses grow." />
    <title>Portfolio Creator - Jake, Product Designer</title>
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

# ============================================================
# 2. STYLES (сброс + переменные + глобальные)
# ============================================================

cat > src/app/styles/reset.css << 'END'
/* Минимальный сброс стилей браузера */
*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html {
  scroll-behavior: smooth;
}

body {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

img, picture, svg {
  display: block;
  max-width: 100%;
}

button,
input,
textarea,
select {
  font: inherit;
  color: inherit;
}

button {
  cursor: pointer;
  border: none;
  background: none;
}

a {
  color: inherit;
  text-decoration: none;
}

ul, ol {
  list-style: none;
}
END

cat > src/app/styles/variables.css << 'END'
/* Все цвета и размеры проекта — единый источник правды */
:root {
  /* Цвета */
  --color-text: #0F0F0F;
  --color-text-muted: #6B6B6B;
  --color-text-light: #999999;
  --color-bg: #FFFFFF;
  --color-bg-dark: #111111;
  --color-bg-soft: #F5F5F5;
  --color-border: #EAEAEA;
  --color-accent-orange: #FF7051;
  --color-accent-purple: #5B4EE8;

  /* Типографика */
  --font-main: 'Inter', system-ui, -apple-system, sans-serif;
  --fw-regular: 400;
  --fw-medium: 500;
  --fw-semibold: 600;
  --fw-bold: 700;
  --fw-black: 900;

  /* Размеры */
  --container: 1200px;
  --radius-sm: 6px;
  --radius: 12px;
  --radius-lg: 20px;

  /* Отступы */
  --space-xs: 8px;
  --space-sm: 16px;
  --space-md: 24px;
  --space-lg: 40px;
  --space-xl: 60px;
  --space-2xl: 100px;

  /* Тени и переходы */
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

/* Общий контейнер для секций */
.container {
  max-width: var(--container);
  margin: 0 auto;
  padding: 0 24px;
}

/* Маленький надзаголовок секций (SERVICES, PROJECTS, FAQ...) */
.eyebrow {
  display: inline-block;
  font-size: 13px;
  font-weight: var(--fw-bold);
  letter-spacing: 0.12em;
  text-transform: uppercase;
  margin-bottom: 16px;
}

.eyebrow--orange { color: var(--color-accent-orange); }
.eyebrow--purple { color: var(--color-accent-purple); }

/* Большой заголовок секции */
.section-title {
  font-size: 48px;
  font-weight: var(--fw-black);
  line-height: 1.1;
  letter-spacing: -0.02em;
  margin-bottom: 40px;
}

.section-title--center { text-align: center; }

/* Секция по умолчанию */
.section {
  padding: var(--space-2xl) 0;
}

.section--dark {
  background: var(--color-bg-dark);
  color: #FFFFFF;
}

.section--soft {
  background: var(--color-bg-soft);
}

/* Адаптив */
@media (max-width: 900px) {
  .section { padding: 60px 0; }
  .section-title { font-size: 32px; }
}
END

# ============================================================
# 3. MAIN + APP
# ============================================================

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
 * App — корневой компонент страницы.
 * Собирает все секции по порядку. Никакой логики тут нет —
 * только композиция. Всё содержимое лежит в data/content.js.
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

# ============================================================
# 4. ДАННЫЕ (единый источник правды)
# ============================================================

cat > src/data/content.js << 'END'
/**
 * ЕДИНЫЙ ФАЙЛ С КОНТЕНТОМ
 *
 * Здесь лежат ВСЕ тексты, ссылки и картинки проекта.
 * Если нужно поменять текст — делаешь это здесь, а не в компонентах.
 * Компоненты только отображают то, что тут лежит.
 *
 * 🖼️ КАРТИНКИ: положи свои в public/images/ и замени путь.
 *    Пример: image: '/images/my-photo.png'
 */

/* ---------- Навигация в шапке ---------- */
export const NAV_LINKS = [
  { label: 'About',      href: '#about' },
  { label: 'Services',   href: '#services' },
  { label: 'Projects',   href: '#projects' },
  { label: 'Blog',       href: '#blogs' },
];

/* ---------- Hero ---------- */
export const HERO = {
  title: [
    { text: 'I design products', accent: true },
    { text: 'that delight and', accent: false },
    { text: 'inspire people.', accent: false },
  ],
  subtitle:
    "Hi! I'm Jake, a product designer based in Berlin. I create user-friendly interfaces for fast-growing startups.",
  photo: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500',
  // ↑ ЗАМЕНИ на '/images/hero-man.png'
  primaryCta: { label: 'Book a call', href: '#footer' },
  secondaryCta: { label: 'Download CV', href: '#' },
  trustedLogos: [
    { name: 'Logoipsum',  image: '' },
    { name: 'Logoipsum',  image: '' },
    { name: 'Logo Ipsum', image: '' },
    { name: 'Logoipsum',  image: '' },
  ],
};

/* ---------- Services ---------- */
export const SERVICES = {
  title: 'Design that solves problems, one product at a time.',
  columns: [
    {
      title: 'What I can do for you',
      description:
        "Faster, better products that your users love. Here's all the services I provide:",
      items: ['Design Strategy', 'Web and Mobile App Design', 'Front-end Development'],
    },
    {
      title: "Applications I'm fluent in",
      description:
        'Every designer needs the right tools to do the perfect job. Thankfully, I\'m multilingual.',
      items: ['Sketch', 'Webflow', 'Figma'],
    },
    {
      title: 'What you can expect',
      description:
        'I design products that are more than pretty. I make them shippable and usable.',
      items: ['Clean and functional', 'Device and user friendly', 'Efficient and maintainable'],
    },
  ],
};

/* ---------- Projects ---------- */
export const PROJECTS = {
  title: 'I bring results.\nMy clients are proof.',
  items: [
    {
      tag: 'Branding',
      title: 'Soulful Rebrand',
      image: 'https://images.unsplash.com/photo-1558655146-9f40138edfeb?w=500',
      href: '#',
    },
    {
      tag: 'Product Design',
      title: 'Datadash Product design',
      image: 'https://images.unsplash.com/photo-1618761714954-0b8cd0026356?w=500',
      href: '#',
    },
    {
      tag: 'Web Design',
      title: 'Maize Website Design',
      image: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=500',
      href: '#',
    },
  ],
};

/* ---------- Blogs (тёмная секция) ---------- */
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

/* ---------- About ---------- */
export const ABOUT = {
  title: "That's me!",
  description:
    "Over the past 12 years, I've worked with a diverse range of clients, from startups to Fortune 500 companies. I love crafting interfaces that delight users and help businesses grow.",
  photos: [
    'https://images.unsplash.com/photo-1618477247222-acbdb0e159b3?w=400',
    'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=600',
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600',
    'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=600',
  ],
};

/* ---------- Resume (Education + Experience) ---------- */
export const RESUME = {
  education: [
    { place: 'Stanford University',       degree: 'MSc (Human Computer Interaction)',  period: '2013-2015', href: '#' },
    { place: 'MIT Summer School',         degree: 'UX Training Bootcamp',             period: '2013-2014', href: '#' },
    { place: 'California State University', degree: 'BSc in Software Engineering',    period: '2009-2012', href: '#' },
  ],
  experience: [
    { company: 'SpaceFleet',   role: 'Senior Product Designer', period: 'April 2019 - Current', href: '#', accent: 'pink' },
    { company: 'MusicMash',    role: 'Information Architect',   period: 'April 2016 - May 2017', href: '#', accent: 'blue' },
    { company: 'Kingdom',      role: 'UI Designer',             period: 'April 2016 - May 2017', href: '#', accent: 'yellow' },
  ],
};

/* ---------- Testimonials ---------- */
export const TESTIMONIALS = [
  {
    quote: "Jade helped us build a software so intuitive that it didn't need a walkthrough. He solved complex problems with brilliant design.",
    author: 'John Franklin',
    role: 'Founder, Double Bunch',
    photo: 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=500',
  },
  {
    quote: "Working with Jake was a game-changer. He took our vague ideas and turned them into a design system we still use today.",
    author: 'Maria Lopez',
    role: 'Product Lead, Nova',
    photo: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500',
  },
];

/* ---------- FAQ ---------- */
export const FAQ = {
  title: 'Frequently asked questions',
  items: [
    { q: 'What type of projects do you take on?',                    a: 'Mostly product design for SaaS, mobile apps and design systems.' },
    { q: 'How do you charge for projects?',                          a: 'Fixed price per project or monthly retainer — depends on scope.' },
    { q: 'What is your hourly rate?',                                a: '$80/hour for freelance, discounted for long-term contracts.' },
    { q: 'What does your design process look like?',                 a: 'Research, wireframes, high-fidelity UI, prototype, handoff.' },
    { q: 'What time-zone do you work in?',                           a: 'CET (Berlin). I overlap 4+ hours with US East Coast.' },
    { q: 'What metrics do you use to measure success?',              a: 'Conversion, retention, task success rate and NPS.' },
    { q: 'What is the typical timeline for a project?',              a: '2–8 weeks depending on the scope of work.' },
    { q: 'What if I need help after the project is complete?',       a: 'You get 30 days of free support after the handoff.' },
  ],
};

/* ---------- Footer ---------- */
export const FOOTER = {
  title: "Ready to make something kickass?",
  accent: "Let's get on a call.",
  brand: 'Portfolio Creator.',
  address: '4351 Delaware Avenue, San Francisco, USA',
  email: 'hi@thefolio.com',
  columns: [
    { title: 'About',    links: ['About', 'Contact', 'Dribbble'] },
    { title: 'Services', links: ['Services', 'Blog', 'Instagram'] },
    { title: 'Experience', links: ['Experience', 'Projects', 'Twitter'] },
  ],
  copyright: '© All rights reserved. Sumit Hegde',
  metaLinks: ['Powered by Webflow', '/Image License Info', '/Instructions', '/Changelog', '/Style Guide'],
};
END

# ============================================================
# 5. UI: Button
# ============================================================

cat > src/components/ui/Button.module.css << 'END'
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  padding: 16px 28px;
  border-radius: var(--radius-sm);
  font-weight: var(--fw-semibold);
  font-size: 15px;
  transition: all var(--transition);
  white-space: nowrap;
}

.btn--primary {
  background: var(--color-text);
  color: #FFFFFF;
}
.btn--primary:hover {
  background: #2A2A2A;
  transform: translateY(-1px);
}

.btn--ghost {
  background: transparent;
  color: var(--color-text);
  padding: 16px 0;
}
.btn--ghost:hover {
  color: var(--color-accent-orange);
}

.arrow {
  transition: transform var(--transition);
}
.btn--ghost:hover .arrow {
  transform: translateX(4px);
}
END

cat > src/components/ui/Button.jsx << 'END'
import styles from './Button.module.css';

/**
 * Универсальная кнопка.
 *
 * variant="primary" — чёрная заливка (основное действие)
 * variant="ghost"   — прозрачная с текстом и стрелкой (второстепенное)
 */
export const Button = ({
  children,
  href = '#',
  variant = 'primary',
  className = '',
  ...rest
}) => (
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

echo "Часть 1 готова"

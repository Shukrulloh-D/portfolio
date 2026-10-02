#!/bin/bash

mkdir -p src/components

# =====================================================
# main.jsx
# =====================================================
cat > src/main.jsx << 'END'
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './index.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
END

# =====================================================
# App.jsx — собирает все секции
# =====================================================
cat > src/App.jsx << 'END'
import Header from './components/Header';
import Hero from './components/Hero';
import Services from './components/Services';
import Projects from './components/Projects';
import Blogs from './components/Blogs';
import About from './components/About';
import Resume from './components/Resume';
import Testimonials from './components/Testimonials';
import Faq from './components/Faq';
import Footer from './components/Footer';

function App() {
  return (
    <>
      <Header />
      <Hero />
      <Services />
      <Projects />
      <Blogs />
      <About />
      <Resume />
      <Testimonials />
      <Faq />
      <Footer />
    </>
  );
}

export default App;
END

# =====================================================
# index.css — глобальные стили
# =====================================================
cat > src/index.css << 'END'
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Inter', sans-serif;
  font-size: 16px;
  line-height: 1.5;
  color: #0f0f0f;
  background: #ffffff;
}

img {
  display: block;
  max-width: 100%;
}

a {
  color: inherit;
  text-decoration: none;
}

button {
  font-family: inherit;
  cursor: pointer;
  border: none;
  background: none;
}

ul {
  list-style: none;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

.section {
  padding: 100px 0;
}

.section-dark {
  background: #111111;
  color: #ffffff;
}

.section-soft {
  background: #f5f5f5;
}

.eyebrow {
  display: inline-block;
  font-size: 13px;
  font-weight: 700;
  letter-spacing: 2px;
  text-transform: uppercase;
  margin-bottom: 16px;
}

.eyebrow-orange { color: #ff7051; }
.eyebrow-purple { color: #5b4ee8; }

.section-title {
  font-size: 48px;
  font-weight: 900;
  line-height: 1.1;
  margin-bottom: 40px;
}

.section-title-center {
  text-align: center;
}

@media (max-width: 900px) {
  .section { padding: 60px 0; }
  .section-title { font-size: 32px; }
}
END

# =====================================================
# HEADER
# =====================================================
cat > src/components/Header.jsx << 'END'
import { useState } from 'react';
import './Header.css';

function Header() {
  const [menuOpen, setMenuOpen] = useState(false);

  return (
    <header className="header">
      <div className="container header-inner">
        <a href="#" className="header-logo">
          Portfolio Creator<span>.</span>
        </a>

        <nav className={`header-nav ${menuOpen ? 'open' : ''}`}>
          <a href="#about">About</a>
          <a href="#services">Services</a>
          <a href="#projects">Projects</a>
          <a href="#blogs">Blog</a>
        </nav>

        <a href="#footer" className="header-cta">
          Book a call <span className="arrow">→</span>
        </a>

        <button className="header-burger" onClick={() => setMenuOpen(!menuOpen)}>
          ☰
        </button>
      </div>
    </header>
  );
}

export default Header;
END

cat > src/components/Header.css << 'END'
.header {
  position: sticky;
  top: 0;
  background: #ffffff;
  border-bottom: 1px solid #eaeaea;
  z-index: 100;
}

.header-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 72px;
  gap: 40px;
}

.header-logo {
  font-size: 20px;
  font-weight: 800;
}

.header-logo span {
  color: #ff7051;
}

.header-nav {
  display: flex;
  gap: 36px;
  font-size: 15px;
  font-weight: 500;
}

.header-nav a:hover {
  color: #ff7051;
}

.header-cta {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  font-size: 15px;
  font-weight: 600;
}

.header-cta .arrow {
  transition: transform 0.2s;
}

.header-cta:hover .arrow {
  transform: translateX(4px);
}

.header-burger {
  display: none;
  font-size: 24px;
}

@media (max-width: 700px) {
  .header-nav { display: none; }
  .header-nav.open {
    display: flex;
    flex-direction: column;
    position: absolute;
    top: 72px;
    left: 0;
    right: 0;
    background: #ffffff;
    padding: 20px;
    border-bottom: 1px solid #eaeaea;
  }
  .header-cta { display: none; }
  .header-burger { display: block; }
}
END

# =====================================================
# HERO
# =====================================================
cat > src/components/Hero.jsx << 'END'
import './Hero.css';

function Hero() {
  return (
    <section className="hero">
      <div className="container">
        <div className="hero-grid">
          <div>
            <h1 className="hero-title">
              I design products<br />
              that delight and<br />
              inspire people.
            </h1>

            <p className="hero-subtitle">
              Hi! I'm Jake, a product designer based in Berlin.
              I create user-friendly interfaces for fast-growing startups.
            </p>

            <div className="hero-actions">
              <a href="#footer" className="btn btn-primary">Book a call</a>
              <a href="#" className="btn btn-ghost">
                Download CV <span className="arrow">→</span>
              </a>
            </div>
          </div>

          <div className="hero-right">
            {/* 🖼️ КАРТИНКА — замени ссылку на свою */}
            <img
              src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500"
              alt="Jake"
            />
          </div>
        </div>

        <div className="hero-trusted">
          <p className="hero-trusted-label">Trusted by</p>
          <div className="hero-logos">
            <span>logoipsum</span>
            <span>logoipsum</span>
            <span>LOGOIPSUM</span>
            <span>logoipsum</span>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Hero;
END

cat > src/components/Hero.css << 'END'
.hero {
  padding: 100px 0 60px;
}

.hero-grid {
  display: grid;
  grid-template-columns: 1.1fr 1fr;
  gap: 80px;
  align-items: center;
}

.hero-title {
  font-size: 72px;
  font-weight: 900;
  line-height: 1.05;
  letter-spacing: -2px;
  margin-bottom: 32px;
}

.hero-subtitle {
  font-size: 18px;
  color: #6b6b6b;
  line-height: 1.55;
  margin-bottom: 40px;
  max-width: 520px;
}

.hero-actions {
  display: flex;
  align-items: center;
  gap: 32px;
  flex-wrap: wrap;
}

.hero-right img {
  width: 100%;
  max-width: 500px;
  aspect-ratio: 5 / 6;
  object-fit: cover;
  filter: grayscale(100%);
  border-radius: 12px;
}

/* кнопки */
.btn {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  padding: 16px 28px;
  border-radius: 6px;
  font-weight: 600;
  font-size: 15px;
  transition: all 0.2s;
}

.btn-primary {
  background: #0f0f0f;
  color: #ffffff;
}

.btn-primary:hover { background: #2a2a2a; }

.btn-ghost {
  background: transparent;
  color: #0f0f0f;
  padding: 16px 0;
}

.btn-ghost:hover { color: #ff7051; }

.btn-ghost .arrow {
  transition: transform 0.2s;
}

.btn-ghost:hover .arrow { transform: translateX(4px); }

.hero-trusted {
  margin-top: 100px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24px;
}

.hero-trusted-label {
  font-size: 14px;
  color: #6b6b6b;
}

.hero-logos {
  display: flex;
  gap: 60px;
  flex-wrap: wrap;
  justify-content: center;
}

.hero-logos span {
  font-size: 20px;
  font-weight: 700;
  opacity: 0.5;
}

@media (max-width: 900px) {
  .hero-grid { grid-template-columns: 1fr; gap: 40px; }
  .hero-title { font-size: 44px; letter-spacing: -1px; }
}
END

# =====================================================
# SERVICES
# =====================================================
cat > src/components/Services.jsx << 'END'
import './Services.css';

function Services() {
  return (
    <section className="section section-soft" id="services">
      <div className="container">
        <p className="eyebrow eyebrow-orange">Services</p>
        <h2 className="section-title section-title-center">
          Design that solves problems,<br />one product at a time.
        </h2>

        <div className="services-grid">
          <div className="services-col">
            <h3>What I can do for you</h3>
            <p>Faster, better products that your users love. Here's all the services I provide:</p>
            <ul>
              <li>Design Strategy</li>
              <li>Web and Mobile App Design</li>
              <li>Front-end Development</li>
            </ul>
          </div>

          <div className="services-col">
            <h3>Applications I'm fluent in</h3>
            <p>Every designer needs the right tools to do the perfect job. Thankfully, I'm multilingual.</p>
            <ul>
              <li>Sketch</li>
              <li>Webflow</li>
              <li>Figma</li>
            </ul>
          </div>

          <div className="services-col">
            <h3>What you can expect</h3>
            <p>I design products that are more than pretty. I make them shippable and usable.</p>
            <ul>
              <li>Clean and functional</li>
              <li>Device and user friendly</li>
              <li>Efficient and maintainable</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Services;
END

cat > src/components/Services.css << 'END'
.services-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 60px;
  padding-top: 60px;
  border-top: 1px solid #eaeaea;
}

.services-col h3 {
  font-size: 22px;
  font-weight: 800;
  margin-bottom: 16px;
}

.services-col p {
  font-size: 15px;
  color: #6b6b6b;
  line-height: 1.6;
  margin-bottom: 28px;
  min-height: 72px;
}

.services-col ul {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.services-col li {
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 15px;
  font-weight: 500;
}

.services-col li::before {
  content: '';
  width: 6px;
  height: 6px;
  background: #0f0f0f;
  flex-shrink: 0;
}

@media (max-width: 900px) {
  .services-grid { grid-template-columns: 1fr; gap: 40px; }
}
END

# =====================================================
# PROJECTS
# =====================================================
cat > src/components/Projects.jsx << 'END'
import './Projects.css';

function Projects() {
  const projects = [
    {
      tag: 'Branding',
      title: 'Soulful Rebrand',
      // 🖼️ КАРТИНКА
      image: 'https://images.unsplash.com/photo-1558655146-9f40138edfeb?w=500',
    },
    {
      tag: 'Product Design',
      title: 'Datadash Product design',
      // 🖼️ КАРТИНКА
      image: 'https://images.unsplash.com/photo-1618761714954-0b8cd0026356?w=500',
    },
    {
      tag: 'Web Design',
      title: 'Maize Website Design',
      // 🖼️ КАРТИНКА
      image: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=500',
    },
  ];

  return (
    <section className="section" id="projects">
      <div className="container">
        <div className="projects-head">
          <div>
            <p className="eyebrow eyebrow-purple">Projects</p>
            <h2 className="projects-title">
              I bring results.<br />
              My clients are proof.
            </h2>
          </div>
          <a href="#" className="projects-view-all">View all projects</a>
        </div>

        <div className="projects-grid">
          {projects.map((project) => (
            <a href="#" className="project-card" key={project.title}>
              <img src={project.image} alt={project.title} />
              <div>
                <span className="project-tag">{project.tag}</span>
                <h3>{project.title}</h3>
                <span className="project-link">View Project →</span>
              </div>
            </a>
          ))}
        </div>
      </div>
    </section>
  );
}

export default Projects;
END

cat > src/components/Projects.css << 'END'
.projects-head {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  gap: 24px;
  margin-bottom: 60px;
}

.projects-title {
  font-size: 48px;
  font-weight: 900;
  line-height: 1.1;
  letter-spacing: -1px;
}

.projects-view-all {
  padding: 14px 24px;
  background: #0f0f0f;
  color: #ffffff;
  border-radius: 6px;
  font-size: 14px;
  font-weight: 600;
}

.projects-view-all:hover { background: #2a2a2a; }

.projects-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
}

.project-card {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.project-card img {
  width: 100%;
  aspect-ratio: 3 / 2;
  object-fit: cover;
  border-radius: 12px;
  transition: transform 0.4s;
}

.project-card:hover img { transform: scale(1.03); }

.project-tag {
  display: inline-block;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 1.5px;
  text-transform: uppercase;
  color: #5b4ee8;
  margin-bottom: 8px;
}

.project-card h3 {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 12px;
}

.project-link { font-size: 14px; font-weight: 600; }

@media (max-width: 900px) {
  .projects-grid { grid-template-columns: 1fr; }
  .projects-head { flex-direction: column; align-items: flex-start; }
  .projects-title { font-size: 32px; }
}
END

# =====================================================
# BLOGS
# =====================================================
cat > src/components/Blogs.jsx << 'END'
import './Blogs.css';

function Blogs() {
  const posts = [
    { date: 'April 16, 2021', readTime: '6 mins', title: 'Design tips for designers, that cover everything you need' },
    { date: 'April 16, 2021', readTime: '5 mins', title: 'How to build rapport with your web design clients' },
    { date: 'April 16, 2021', readTime: '5 mins', title: 'Top 6 free website mockup tools 2021' },
    { date: 'April 16, 2021', readTime: '7 mins', title: 'Logo design trends to avoid in 2021' },
    { date: 'April 16, 2021', readTime: '7 mins', title: '22 best UI design tools' },
  ];

  return (
    <section className="section section-dark" id="blogs">
      <div className="container">
        <div className="blogs-head">
          <div>
            <p className="eyebrow eyebrow-orange">Blogs</p>
            <h2 className="blogs-title">Latest Blogs</h2>
          </div>
          <a href="#" className="blogs-view-all">View all →</a>
        </div>

        <ul className="blogs-list">
          {posts.map((post, i) => (
            <li key={i}>
              <a href="#" className="blog-item">
                <span className="blog-meta">{post.date} · {post.readTime}</span>
                <div className="blog-content">
                  <h3>{post.title}</h3>
                  <span className="blog-link">Read the article →</span>
                </div>
              </a>
            </li>
          ))}
        </ul>
      </div>
    </section>
  );
}

export default Blogs;
END

cat > src/components/Blogs.css << 'END'
.blogs-head {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  gap: 24px;
  margin-bottom: 60px;
}

.blogs-title {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -1px;
  margin-top: 8px;
}

.blogs-view-all { font-size: 14px; font-weight: 600; }

.blogs-list {
  display: flex;
  flex-direction: column;
}

.blog-item {
  display: grid;
  grid-template-columns: 200px 1fr;
  gap: 40px;
  padding: 32px 0;
  border-top: 1px solid rgba(255, 255, 255, 0.12);
  transition: opacity 0.2s;
}

.blog-item:last-child {
  border-bottom: 1px solid rgba(255, 255, 255, 0.12);
}

.blog-item:hover { opacity: 0.75; }

.blog-meta {
  font-size: 13px;
  color: #999999;
}

.blog-content {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.blog-content h3 {
  font-size: 20px;
  font-weight: 700;
  line-height: 1.35;
  color: #ffffff;
}

.blog-link {
  font-size: 13px;
  font-weight: 600;
  color: #ffffff;
}

@media (max-width: 700px) {
  .blog-item { grid-template-columns: 1fr; gap: 12px; }
  .blogs-title { font-size: 28px; }
}
END

# =====================================================
# ABOUT
# =====================================================
cat > src/components/About.jsx << 'END'
import './About.css';

function About() {
  const photos = [
    // 🖼️ КАРТИНКИ — замени на свои
    'https://images.unsplash.com/photo-1618477247222-acbdb0e159b3?w=400',
    'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=600',
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600',
    'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=600',
  ];

  return (
    <section className="section" id="about">
      <div className="container">
        <div className="about-head">
          <div>
            <p className="eyebrow eyebrow-orange">Product Designer</p>
            <h2 className="about-title">That's me!</h2>
          </div>
          <p className="about-description">
            Over the past 12 years, I've worked with a diverse range of clients,
            from startups to Fortune 500 companies. I love crafting interfaces
            that delight users and help businesses grow.
          </p>
        </div>

        <div className="about-gallery">
          {photos.map((photo, i) => (
            <img key={i} src={photo} alt="" />
          ))}
        </div>
      </div>
    </section>
  );
}

export default About;
END

cat > src/components/About.css << 'END'
.about-head {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 60px;
  align-items: start;
  margin-bottom: 60px;
}

.about-title {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -1px;
  margin-top: 8px;
}

.about-description {
  font-size: 16px;
  color: #6b6b6b;
  line-height: 1.7;
  padding-top: 32px;
}

.about-gallery {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px;
}

.about-gallery img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 12px;
}

.about-gallery img:nth-child(1) { grid-row: 1 / 3; min-height: 600px; }
.about-gallery img:nth-child(2) { min-height: 288px; }
.about-gallery img:nth-child(3) { min-height: 288px; }
.about-gallery img:nth-child(4) { grid-column: 2 / 4; min-height: 288px; }

@media (max-width: 900px) {
  .about-head { grid-template-columns: 1fr; gap: 24px; }
  .about-title { font-size: 28px; }
  .about-gallery { grid-template-columns: 1fr; }
  .about-gallery img,
  .about-gallery img:nth-child(1),
  .about-gallery img:nth-child(4) {
    grid-column: auto;
    grid-row: auto;
    min-height: 240px;
  }
}
END

# =====================================================
# RESUME
# =====================================================
cat > src/components/Resume.jsx << 'END'
import './Resume.css';

function Resume() {
  const education = [
    { place: 'Stanford University', degree: 'MSc (Human Computer Interaction)', period: '2013-2015' },
    { place: 'MIT Summer School', degree: 'UX Training Bootcamp', period: '2013-2014' },
    { place: 'California State University', degree: 'BSc in Software Engineering', period: '2009-2012' },
  ];

  const experience = [
    { emoji: '🚀', bg: 'pink', company: 'SpaceFleet', role: 'Senior Product Designer', period: 'April 2019 - Current' },
    { emoji: '🎵', bg: 'blue', company: 'MusicMash', role: 'Information Architect', period: 'April 2016 - May 2017' },
    { emoji: '👑', bg: 'yellow', company: 'Kingdom', role: 'UI Designer', period: 'April 2016 - May 2017' },
  ];

  return (
    <section className="section section-soft">
      <div className="container">
        <div className="resume-grid">
          <div>
            <h3 className="resume-title">📚 Education</h3>
            {education.map((item) => (
              <a href="#" className="resume-item" key={item.place}>
                <div>
                  <div className="resume-place">{item.place}</div>
                  <div className="resume-degree">{item.degree}</div>
                </div>
                <span className="resume-period">{item.period}</span>
                <span className="resume-arrow">↗</span>
              </a>
            ))}
          </div>

          <div>
            <h3 className="resume-title">💼 Work Experience</h3>
            {experience.map((item) => (
              <a href="#" className="resume-item" key={item.company}>
                <div className="resume-item-main">
                  <div className={`resume-badge bg-${item.bg}`}>{item.emoji}</div>
                  <div>
                    <div className="resume-place">{item.company}</div>
                    <div className="resume-degree">{item.role}</div>
                  </div>
                </div>
                <span className="resume-period">{item.period}</span>
                <span className="resume-arrow">↗</span>
              </a>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}

export default Resume;
END

cat > src/components/Resume.css << 'END'
.resume-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
}

.resume-title {
  font-size: 32px;
  font-weight: 800;
  margin-bottom: 32px;
}

.resume-item {
  display: grid;
  grid-template-columns: 1fr auto auto;
  gap: 20px;
  align-items: center;
  padding: 24px 0;
  border-bottom: 1px solid #eaeaea;
  transition: opacity 0.2s;
}

.resume-item:hover { opacity: 0.7; }

.resume-item-main {
  display: flex;
  align-items: center;
  gap: 16px;
}

.resume-badge {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  flex-shrink: 0;
}

.bg-pink { background: #ffe0ec; }
.bg-blue { background: #e0eaff; }
.bg-yellow { background: #fff4cc; }

.resume-place { font-size: 18px; font-weight: 700; }
.resume-degree { font-size: 14px; color: #6b6b6b; margin-top: 4px; }
.resume-period { font-size: 14px; color: #6b6b6b; }

.resume-arrow {
  font-size: 16px;
  transition: transform 0.2s;
}

.resume-item:hover .resume-arrow { transform: translate(4px, -4px); }

@media (max-width: 900px) {
  .resume-grid { grid-template-columns: 1fr; gap: 40px; }
  .resume-title { font-size: 24px; }
}
END

# =====================================================
# TESTIMONIALS
# =====================================================
cat > src/components/Testimonials.jsx << 'END'
import { useState } from 'react';
import './Testimonials.css';

function Testimonials() {
  const items = [
    {
      quote: "Jade helped us build a software so intuitive that it didn't need a walkthrough. He solved complex problems with brilliant design.",
      author: 'John Franklin',
      role: 'Founder, Double Bunch',
      // 🖼️ КАРТИНКА
      photo: 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=500',
    },
    {
      quote: 'Working with Jake was a game-changer. He took our vague ideas and turned them into a design system we still use today.',
      author: 'Maria Lopez',
      role: 'Product Lead, Nova',
      // 🖼️ КАРТИНКА
      photo: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500',
    },
  ];

  const [index, setIndex] = useState(0);
  const item = items[index];

  const next = () => setIndex(index === items.length - 1 ? 0 : index + 1);
  const prev = () => setIndex(index === 0 ? items.length - 1 : index - 1);

  return (
    <section className="section">
      <div className="container">
        <p className="eyebrow eyebrow-purple">Testimonials</p>
        <h2 className="testimonials-title">Word on the street</h2>

        <div className="testimonials-wrap">
          <div className="testimonials-photo">
            <img src={item.photo} alt={item.author} />
            <div className="testimonials-nav">
              <button onClick={prev}>←</button>
              <button onClick={next}>→</button>
            </div>
          </div>

          <div>
            <p className="testimonials-quote">{item.quote}</p>
            <div className="testimonials-author">
              <span className="testimonials-author-name">{item.author}</span>
              <span className="testimonials-author-role">{item.role}</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Testimonials;
END

cat > src/components/Testimonials.css << 'END'
.testimonials-title {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -1px;
  margin-top: 8px;
  margin-bottom: 60px;
}

.testimonials-wrap {
  display: grid;
  grid-template-columns: 400px 1fr;
  gap: 80px;
  align-items: center;
}

.testimonials-photo { position: relative; }

.testimonials-photo img {
  width: 100%;
  aspect-ratio: 1;
  object-fit: cover;
  border-radius: 12px;
}

.testimonials-nav {
  position: absolute;
  bottom: 20px;
  right: 20px;
  display: flex;
  background: #0f0f0f;
  border-radius: 6px;
  overflow: hidden;
}

.testimonials-nav button {
  width: 44px;
  height: 44px;
  color: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
}

.testimonials-nav button:hover { background: #2a2a2a; }

.testimonials-quote {
  font-size: 26px;
  font-weight: 500;
  line-height: 1.5;
  margin-bottom: 40px;
  position: relative;
  padding-left: 60px;
}

.testimonials-quote::before {
  content: '❝';
  position: absolute;
  left: 0;
  top: -10px;
  font-size: 48px;
  color: #ff7051;
  line-height: 1;
}

.testimonials-author {
  display: flex;
  flex-direction: column;
  gap: 4px;
  padding-left: 60px;
}

.testimonials-author-name { font-weight: 700; font-size: 16px; }
.testimonials-author-role { font-size: 14px; color: #6b6b6b; }

@media (max-width: 900px) {
  .testimonials-wrap { grid-template-columns: 1fr; gap: 40px; }
  .testimonials-title { font-size: 28px; margin-bottom: 32px; }
  .testimonials-quote { font-size: 20px; padding-left: 40px; }
  .testimonials-author { padding-left: 40px; }
}
END

# =====================================================
# FAQ
# =====================================================
cat > src/components/Faq.jsx << 'END'
import { useState } from 'react';
import './Faq.css';

function Faq() {
  const faqs = [
    { q: 'What type of projects do you take on?', a: 'Mostly product design for SaaS, mobile apps and design systems.' },
    { q: 'How do you charge for projects?', a: 'Fixed price per project or monthly retainer — depends on scope.' },
    { q: 'What is your hourly rate?', a: '$80/hour for freelance, discounted for long-term contracts.' },
    { q: 'What does your design process look like?', a: 'Research, wireframes, high-fidelity UI, prototype, handoff.' },
    { q: 'What time-zone do you work in?', a: 'CET (Berlin). I overlap 4+ hours with US East Coast.' },
    { q: 'What metrics do you use to measure success?', a: 'Conversion, retention, task success rate and NPS.' },
    { q: 'What is the typical timeline for a project?', a: '2–8 weeks depending on the scope of work.' },
    { q: 'What if I need help after the project is complete?', a: 'You get 30 days of free support after the handoff.' },
  ];

  const [openIndex, setOpenIndex] = useState(-1);

  const toggle = (index) => {
    setOpenIndex(openIndex === index ? -1 : index);
  };

  return (
    <section className="section section-dark">
      <div className="container">
        <p className="eyebrow eyebrow-orange">FAQ</p>
        <h2 className="faq-title">Frequently asked questions</h2>

        <div className="faq-grid">
          {faqs.map((item, index) => (
            <div className="faq-item" key={index}>
              <button className="faq-header" onClick={() => toggle(index)}>
                <span>{item.q}</span>
                <span className={`faq-icon ${openIndex === index ? 'open' : ''}`}>⌄</span>
              </button>
              {openIndex === index && <p className="faq-body">{item.a}</p>}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

export default Faq;
END

cat > src/components/Faq.css << 'END'
.faq-title {
  font-size: 40px;
  font-weight: 900;
  text-align: center;
  letter-spacing: -1px;
  margin-top: 8px;
  margin-bottom: 60px;
}

.faq-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 0 60px;
}

.faq-item {
  border-bottom: 1px solid rgba(255, 255, 255, 0.15);
}

.faq-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  padding: 24px 0;
  font-size: 17px;
  font-weight: 600;
  color: #ffffff;
  text-align: left;
  gap: 20px;
}

.faq-icon {
  font-size: 20px;
  transition: transform 0.2s;
  flex-shrink: 0;
}

.faq-icon.open { transform: rotate(180deg); }

.faq-body {
  padding-bottom: 24px;
  font-size: 15px;
  line-height: 1.6;
  color: #aaaaaa;
}

@media (max-width: 900px) {
  .faq-grid { grid-template-columns: 1fr; gap: 0; }
  .faq-title { font-size: 28px; margin-bottom: 32px; }
}
END

# =====================================================
# FOOTER
# =====================================================
cat > src/components/Footer.jsx << 'END'
import './Footer.css';

function Footer() {
  return (
    <footer className="footer" id="footer">
      <div className="container">
        <div className="footer-top">
          <h2 className="footer-title">Ready to make something kickass?</h2>
          <p className="footer-accent">Let's get on a call.</p>
        </div>

        <div className="footer-middle">
          <div>
            <div className="footer-brand">Portfolio Creator.</div>
            <p className="footer-line">4351 Delaware Avenue, San Francisco, USA</p>
            <p className="footer-line">✉ hi@thefolio.com</p>
          </div>

          <div>
            <div className="footer-col-title">About</div>
            <a href="#" className="footer-link">About</a>
            <a href="#" className="footer-link">Contact</a>
            <a href="#" className="footer-link">Dribbble</a>
          </div>

          <div>
            <div className="footer-col-title">Services</div>
            <a href="#" className="footer-link">Services</a>
            <a href="#" className="footer-link">Blog</a>
            <a href="#" className="footer-link">Instagram</a>
          </div>

          <div>
            <div className="footer-col-title">Experience</div>
            <a href="#" className="footer-link">Experience</a>
            <a href="#" className="footer-link">Projects</a>
            <a href="#" className="footer-link">Twitter</a>
          </div>
        </div>

        <div className="footer-bottom">
          <span>© All rights reserved. Sumit Hegde</span>
          <div className="footer-meta">
            <a href="#">Powered by Webflow</a>
            <a href="#">Image License Info</a>
            <a href="#">Instructions</a>
            <a href="#">Changelog</a>
            <a href="#">Style Guide</a>
          </div>
        </div>
      </div>
    </footer>
  );
}

export default Footer;
END

cat > src/components/Footer.css << 'END'
.footer {
  background: #111111;
  color: #ffffff;
  padding: 100px 0 40px;
}

.footer-top { margin-bottom: 80px; }

.footer-title {
  font-size: 48px;
  font-weight: 900;
  line-height: 1.1;
  letter-spacing: -1px;
  margin-bottom: 12px;
}

.footer-accent {
  font-size: 48px;
  font-weight: 900;
  color: #5b4ee8;
  letter-spacing: -1px;
}

.footer-middle {
  display: grid;
  grid-template-columns: 1.5fr 1fr 1fr 1fr;
  gap: 60px;
  padding: 60px 0;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.footer-brand {
  font-size: 20px;
  font-weight: 800;
  margin-bottom: 20px;
}

.footer-line {
  font-size: 14px;
  color: #aaaaaa;
  margin-bottom: 12px;
  line-height: 1.6;
}

.footer-col-title {
  font-size: 14px;
  font-weight: 700;
  margin-bottom: 20px;
}

.footer-link {
  display: block;
  font-size: 14px;
  color: #aaaaaa;
  margin-bottom: 12px;
  transition: color 0.2s;
}

.footer-link:hover { color: #ffffff; }

.footer-bottom {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
  padding-top: 32px;
  font-size: 13px;
  color: #777777;
}

.footer-meta {
  display: flex;
  gap: 24px;
  flex-wrap: wrap;
}

.footer-meta a:hover { color: #ffffff; }

@media (max-width: 900px) {
  .footer-title, .footer-accent { font-size: 28px; }
  .footer-middle { grid-template-columns: 1fr 1fr; gap: 32px; }
  .footer-bottom { flex-direction: column; }
}
END

echo ""
echo "═══════════════════════════════════════════"
echo "✅ ГОТОВО"
echo "═══════════════════════════════════════════"
echo ""
echo "Запусти: npm run dev"

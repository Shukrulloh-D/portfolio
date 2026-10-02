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

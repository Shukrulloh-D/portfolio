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

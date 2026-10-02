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

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

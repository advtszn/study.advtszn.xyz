import { h } from "preact"

const css = `
footer.site-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 4rem;
  opacity: 0.7;
  font-size: 0.9rem;
}
`

export const SiteFooter = () => {
  const Footer = ({ displayClass }) =>
    h(
      "footer",
      { class: `site-footer ${displayClass ?? ""}` },
      h("a", { href: "https://advtszn.xyz/socials", target: "_blank" }, "socials"),
      h("a", { href: "https://advtszn.xyz", target: "_blank" }, "advtszn.xyz"),
    )
  Footer.css = css
  return Footer
}

export default SiteFooter

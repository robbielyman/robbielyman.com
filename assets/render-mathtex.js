let eqns = document.querySelectorAll("script[type='math/tex']");
for (let i=eqns.length-1; i>=0; i--) {
    let eqn = eqns[i];
    let src = eqn.text;
    let d = eqn.closest('p') == null;
    const mathString = temml.renderToString(src, { displayMode: d, wrap: "tex" });
    eqn.outerHTML = d ? `<div class="math-block">${mathString}</div>` : mathString;
}


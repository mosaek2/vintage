import { useContext } from "react";
import { ContextSystem } from "../functions/MyContext";
import "./Main.css";

export default function Main({ children }) {
  const { get, set } = useContext(ContextSystem);

  function handleMouseOverMain() {
    set.setHeader({
      ...get.header,
      isHeaderExtend: false,
      isManShow: false,
      isWomenShow: false,
      isKidShow: false,
      isAccShow: false,
      isComShow: false,
    });
  }

  return (
    <div id="Main">
      <main onMouseOver={handleMouseOverMain}>
        <div className={get.header.isHeaderExtend ? "darker" : undefined}></div>
        {children}
      </main>
    </div>
  );
}

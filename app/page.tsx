import { h1 } from "./utils/font-loaders";
export default function Home() {
  return (
    <main className="h-screen">
      <div className="pt-[90px] px-40">
        <h1
          className={`capitalize 
          font-extrabold 
          text-4xl 
          ${h1.className} 
          tracking-widest
          mb-[60px] 
          transition-all`}
        >
          MARKET
        </h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste animi
          odio repudiandae inventore soluta corporis minima commodi, ducimus
          culpa itaque obcaecati earum facilis vitae alias fugiat dolore
          distinctio omnis illo.
        </p>
      </div>
    </main>
  );
}

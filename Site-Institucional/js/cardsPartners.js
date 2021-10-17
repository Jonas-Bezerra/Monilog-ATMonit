// import { cards } from "./strings.mjs";
class CardPartners {
    constructor(cardPartner, describe) {
        this.cardPartner = document.getElementById(cardPartner);
        this.describe = describe;
    }
    
    setDescribe() {
        this.cardPartner.innerHTML = this.describe;
    }
}
// Comentado por que o import não funciona bem
// for (let i = 0; i < cards.length; i++) {
//     const card = cards[i];
    
//     const cardPartner = new CardPartners(
//         `card-partner${i+1}`,
//         card.describe
//     );
//     cardPartner.setDescribe();    
// }

const cardPartner1 = new CardPartners(
    "card-partner1",
    "Responsável pela criação da nossa empresa a faculdade Bandtec Digital School"
);
cardPartner1.setDescribe();

const cardPartner2 = new CardPartners(
    "card-partner2",
    "A ValeMobi é responsável pelo nosso estágio, onde aprendemos tecnologia na prática" 
);
cardPartner2.setDescribe();


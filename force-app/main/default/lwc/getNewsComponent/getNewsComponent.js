import { LightningElement,track} from 'lwc';

import retriveNews from "@salesforce/apex/NewsController.retriveNews";

export default class Getnewscomponent extends LightningElement {

@track  result=[];

@track selectedNews={};

connectedCallback(){

    this.fetchNews();

}

fetchNews(){

    retriveNews().then(response=>{

        console.log(response);

        this.formatNewsData(response.articles)

    }).catch(error=>{

        console.error(error);

    })

}
formatNewsData(res){

    this.result = res.map((item, index)=>{

        let id = `new_${index+1}`;

        let date = new Date(item.publishedAt).toDateString()

        let name = item.source.name;

        let author = item.author;

        let title = item.title;
        let content = item.content;
        let url = item.url;
        let urlToImage = item.urlToImage;

        return { ...item, id: id, name: name, date: date,author:author,title:title,content:content,url:url,urlToImage:urlToImage}

    })



}

showModal(event){

    let id = event.target.dataset.item;

    this.result.forEach(item=>{

        if(item.id === id){

            this.selectedNews ={...item}

            console.log('display:'+ this.selectedNews);

        }

    })

    this.isModalOpen = true;

}

/****closeModal method close the modal ****/

closeModal(){

    this.isModalOpen = false;

}

}
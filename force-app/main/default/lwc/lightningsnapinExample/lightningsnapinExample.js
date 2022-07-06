import { LightningElement,track } from 'lwc';
//import { assignHandler, maximize } from 'lightningsnapin/minimized';
import BaseChatHeader from 'lightningsnapin/baseChatHeader';
export default class LightningsnapinExample extends LightningElement {

    strRecordId;
    arrayFields = ['Name', 'Type', 'Phone', 'AccountNumber', 'Website'];

    /*
    text;

    connectedCallback() {
        this.assignHandler("prechatState", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("offlineSupportState", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("waitingState", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("waitingEndedState", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("chatState", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("chatTimeoutUpdate", (data) => {
            this.setText("You will time out soon.");
        });
        this.assignHandler("chatTimeoutClear", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("chatEndedState", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("reconnectingState", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("postchatState", (data) => {
            this.setText(data.label);
        });
        this.assignHandler("chatConferenceState", (data) => {
            this.setText(data.label);
        });
    }

    setText(str) {
        if (typeof str !== "string") {
            throw new Error("Expected text value to be a `String` but received: " + str + ".");
        }
        this.text = str;
    }
  */

    // @track message;

    // constructor() {
    //     super();

    //     // Assign handler per event.
    //     assignHandler("prechatState", this.setMinimizedMessage.bind(this));
    //     assignHandler("offlineSupportState", this.setMinimizedMessage.bind(this));
    //     assignHandler("waitingState", this.setMinimizedMessage.bind(this));
    //     assignHandler("queueUpdate", this.setMinimizedQueuePosition.bind(this));
    //     assignHandler("waitingEndedState", this.setMinimizedMessage.bind(this));
    //     assignHandler("chatState", this.setMinimizedChatState.bind(this));
    //     assignHandler("chatTimeoutUpdate", this.setMinimizedMessage.bind(this));
    //     assignHandler("chatUnreadMessage", this.setMinimizedMessage.bind(this));
    //     assignHandler("chatTransferringState", this.setMinimizedMessage.bind(this));
    //     assignHandler("chatEndedState", this.setMinimizedMessage.bind(this));
    //     assignHandler("reconnectingState", this.setMinimizedMessage.bind(this));
    //     assignHandler("postchatState", this.setMinimizedMessage.bind(this));
    // }

    // handleClick() {
    //     maximize();
    // }

    // setMinimizedMessage(eventData) {
    //     this.message = eventData.label;
    // }

    // setMinimizedQueuePosition(eventData) {
    //     this.message = eventData.label;
    //     // For queue position = 0, the label will be "You're next!"
    //     if (eventData.queuePosition) {
    //         this.message += " " + eventData.queuePosition;
    //     }
    // }

    // setMinimizedChatState(eventData) {
    //     this.message = eventData.agentName;
    // }

}
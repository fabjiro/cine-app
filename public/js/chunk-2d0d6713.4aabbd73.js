(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d0d6713"],{7323:function(t,e,a){"use strict";a.r(e);var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-app",[a("v-main",[a("h1",{staticClass:"text-center"},[t._v("Proximamente")]),a("v-container",t._l(t.listProximamente,(function(e,i){return a("v-row",{key:i,attrs:{justify:"center"}},[a("v-col",{attrs:{cols:"12",sm:"5"}},[a("v-card",{attrs:{elevation:"5"}},[a("v-img",{attrs:{"max-height":"200",contain:"",src:e["portada"]}}),a("v-card-title",[t._v(t._s(e["title"]))]),a("v-divider"),a("v-card-actions",[a("v-spacer"),a("v-btn",{attrs:{fab:"",small:"",color:"accent"}},[a("v-icon",{attrs:{color:"white"}},[t._v("mdi-pencil")])],1),a("v-btn",{attrs:{fab:"",small:"",color:"red"}},[a("v-icon",{attrs:{color:"white"},on:{click:function(a){return t.deleted(e)}}},[t._v("mdi-delete")])],1)],1)],1)],1)],1)})),1)],1),a("DialogAdd",{attrs:{refresh:t.getProximamente}}),t.deleteDialog?a("DialogDeleted",{attrs:{item:t.itemSelected,toggle:t.toggleDialog,refresh:t.getProximamente}}):t._e()],1)},r=[],s=a("780a"),o=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"text-center"},[a("v-dialog",{attrs:{persistent:"","max-width":"600px"},model:{value:t.showDialog,callback:function(e){t.showDialog=e},expression:"showDialog"}},[a("v-card",{attrs:{disabled:t.isRequest,loading:t.isRequest}},[a("v-card-title",[a("span",{staticClass:"text-h5"},[t._v("Agregar Proximamente")])]),a("v-divider"),a("v-card-text",[a("v-row",[a("v-container",[a("v-row",{staticClass:"mt-0"},[a("v-col",{attrs:{cols:"12",lg:"12",sm:"6",md:"4"}},[a("v-form",{ref:"form"},[a("v-text-field",{attrs:{required:"",label:"Titulo",outlined:"",rules:t.requiredParam},model:{value:t.dataForm.title,callback:function(e){t.$set(t.dataForm,"title",e)},expression:"dataForm.title"}}),a("v-file-input",{attrs:{required:"",counter:"","show-size":"","truncate-length":"10",accept:"image/*",label:"Portada",outlined:"",rules:t.requiredParam},on:{change:function(e){return t.dataForm.portada=e}}}),a("v-textarea",{attrs:{required:"",outlined:"",label:"Descripcion",rules:t.requiredParam},model:{value:t.dataForm.description,callback:function(e){t.$set(t.dataForm,"description",e)},expression:"dataForm.description"}})],1)],1)],1)],1)],1)],1),a("v-card-actions",[a("v-spacer"),a("v-btn",{attrs:{color:"blue darken-1",text:""},on:{click:function(e){return t.toggleDialog()}}},[t._v(" Cerrar ")]),a("v-btn",{staticClass:"white--text",attrs:{color:"blue darken-1"},on:{click:function(e){return t.saved()}}},[t._v(" Guardar ")])],1)],1)],1),a("v-btn",{attrs:{fab:"",dark:"",small:"",color:"blue",fixed:"",right:"",bottom:""},on:{click:function(e){return t.toggleDialog()}}},[a("v-icon",[t._v("mdi-plus")])],1)],1)},l=[],n=a("7bea"),d={data:()=>({valid:!0,isRequest:!1,showDialog:!1,requiredParam:[t=>!!t||"Parametro es requerido"],dataForm:{title:null,description:null,portada:null}}),methods:{toggleDialog(){this.showDialog=!this.showDialog},saved(){if(this.$refs.form.validate()){this.isRequest=!0;let t=new FormData;t.append("title",this.dataForm.title),t.append("description",this.dataForm.description),t.append("portada",this.dataForm.portada),s["a"].post("/api/proximamente",t).then(t=>{this.isRequest=!1,200==t.data["status"]&&(this.refresh(),this.toggleDialog())})}}},components:{LoadAnimation:n["a"]},props:["refresh"]},c=d,u=a("2877"),h=a("6544"),m=a.n(h),v=a("8336"),p=a("b0af"),g=a("99d9"),f=a("62ad"),V=a("a523"),b=a("169a"),w=a("ce7e"),x=a("23a7"),_=a("58df"),D=a("7e2b"),C=a("3206"),q=Object(_["a"])(D["a"],Object(C["b"])("form")).extend({name:"v-form",provide(){return{form:this}},inheritAttrs:!1,props:{disabled:Boolean,lazyValidation:Boolean,readonly:Boolean,value:Boolean},data:()=>({inputs:[],watchers:[],errorBag:{}}),watch:{errorBag:{handler(t){const e=Object.values(t).includes(!0);this.$emit("input",!e)},deep:!0,immediate:!0}},methods:{watchInput(t){const e=t=>t.$watch("hasError",e=>{this.$set(this.errorBag,t._uid,e)},{immediate:!0}),a={_uid:t._uid,valid:()=>{},shouldValidate:()=>{}};return this.lazyValidation?a.shouldValidate=t.$watch("shouldValidate",i=>{i&&(this.errorBag.hasOwnProperty(t._uid)||(a.valid=e(t)))}):a.valid=e(t),a},validate(){return 0===this.inputs.filter(t=>!t.validate(!0)).length},reset(){this.inputs.forEach(t=>t.reset()),this.resetErrorBag()},resetErrorBag(){this.lazyValidation&&setTimeout(()=>{this.errorBag={}},0)},resetValidation(){this.inputs.forEach(t=>t.resetValidation()),this.resetErrorBag()},register(t){this.inputs.push(t),this.watchers.push(this.watchInput(t))},unregister(t){const e=this.inputs.find(e=>e._uid===t._uid);if(!e)return;const a=this.watchers.find(t=>t._uid===e._uid);a&&(a.valid(),a.shouldValidate()),this.watchers=this.watchers.filter(t=>t._uid!==e._uid),this.inputs=this.inputs.filter(t=>t._uid!==e._uid),this.$delete(this.errorBag,e._uid)}},render(t){return t("form",{staticClass:"v-form",attrs:{novalidate:!0,...this.attrs$},on:{submit:t=>this.$emit("submit",t)}},this.$slots.default)}}),k=a("132d"),B=a("0fd9"),P=a("2fa4"),F=a("8654"),$=a("a844"),R=Object(u["a"])(c,o,l,!1,null,null,null),E=R.exports;m()(R,{VBtn:v["a"],VCard:p["a"],VCardActions:g["a"],VCardText:g["b"],VCardTitle:g["c"],VCol:f["a"],VContainer:V["a"],VDialog:b["a"],VDivider:w["a"],VFileInput:x["a"],VForm:q,VIcon:k["a"],VRow:B["a"],VSpacer:P["a"],VTextField:F["a"],VTextarea:$["a"]});var A=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"text-center"},[a("v-dialog",{attrs:{persistent:"","max-width":"400"},model:{value:t.showModal,callback:function(e){t.showModal=e},expression:"showModal"}},[a("v-card",{attrs:{loading:t.isRequest,disabled:t.isRequest}},[a("v-card-title",[a("span",{staticClass:"text-h5"},[t._v("Eliminar elemento")])]),a("v-divider"),a("v-card-actions",[a("v-spacer"),a("v-btn",{attrs:{color:"error"},on:{click:function(e){return t.deleted()}}},[t._v(" Eliminar ")]),a("v-btn",{attrs:{color:"primary"},on:{click:t.toggle}},[t._v(" Cancelar ")])],1)],1)],1)],1)},y=[],T={data:()=>({showModal:!0,isRequest:!1}),methods:{deleted(){this.isRequest=!0,s["a"].delete("/api/proximamente/"+this.item["id"]).then(t=>{this.isRequest=!1,200==t.data["status"]&&(this.refresh(),this.toggle())})}},props:["toggle","item","refresh"]},j=T,O=Object(u["a"])(j,A,y,!1,null,null,null),I=O.exports;m()(O,{VBtn:v["a"],VCard:p["a"],VCardActions:g["a"],VCardTitle:g["c"],VDialog:b["a"],VDivider:w["a"],VSpacer:P["a"]});var S={data:()=>({listProximamente:[],deleteDialog:!1,itemSelected:null}),methods:{getProximamente(){s["a"].get("/api/proximamente").then(t=>{this.listProximamente=t.data})},deleted(t){this.itemSelected=t,this.toggleDialog()},toggleDialog(){this.deleteDialog=!this.deleteDialog}},created(){this.getProximamente()},components:{DialogAdd:E,DialogDeleted:I}},M=S,z=a("7496"),J=a("adda"),G=a("f6c4"),L=Object(u["a"])(M,i,r,!1,null,null,null);e["default"]=L.exports;m()(L,{VApp:z["a"],VBtn:v["a"],VCard:p["a"],VCardActions:g["a"],VCardTitle:g["c"],VCol:f["a"],VContainer:V["a"],VDivider:w["a"],VIcon:k["a"],VImg:J["a"],VMain:G["a"],VRow:B["a"],VSpacer:P["a"]})}}]);
//# sourceMappingURL=chunk-2d0d6713.4aabbd73.js.map
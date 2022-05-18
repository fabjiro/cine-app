import axios from "axios";

const axiosInstance = axios.create({
  baseURL: "https://cinefabjiro.herokuapp.com",
  headers: {
    "Content-Type": "application/json; charset=utf-8",
    "Access-Control-Allow-Origin": "*",
  },
});
export default axiosInstance;

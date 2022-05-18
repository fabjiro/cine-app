import axios from "axios";

const axiosInstance = axios.create({
  baseURL: "http://192.168.1.5:3000/",
  headers: {
    "Content-Type": "application/json; charset=utf-8",
    "Access-Control-Allow-Origin": "*",
  },
});
export default axiosInstance;

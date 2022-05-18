import io from "socket.io-client";

const socket = {
  _io: null,
  config: function (addres) {
    if (!this._io) {
      this._io = io(addres);
    }
    return this._io;
  },
};

export default socket;

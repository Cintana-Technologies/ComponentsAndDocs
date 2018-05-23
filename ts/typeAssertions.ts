let msg;

msg = 'abc';

let endsWithC = (<string>msg).endsWith('c');

let alt = (msg as string).endsWith('c');
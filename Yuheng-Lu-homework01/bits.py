# Part 1 goes here!

class DecodeError(Exception): pass


class ChunkError(Exception): pass


class BitList:
    def __init__(self, str_bit):
        for i in str_bit:
            if i != "1" and i != "0":
                raise ValueError('Format is invalid; does not consist of only 0 and 1')
        self.str_bit = str_bit

    def __eq__(self, other):
        return self.str_bit == other

    @staticmethod
    def from_ints(*args):
        temp_str = ""
        for i in args:
            temp_str += str(i)
        return BitList(temp_str)

    def __str__(self):
        return self.str_bit

    def arithmetic_shift_left(self):
        temp = self.str_bit
        temp += "0"
        self.str_bit = temp[1:]

    def arithmetic_shift_right(self):
        temp = self.str_bit
        added = temp[0]
        temp = added + temp
        self.str_bit = temp[:-1]

    def bitwise_and(self, otherBitList):
        if len(self.str_bit) != len(otherBitList.str_bit):
            raise ValueError('Two Bitlists are not in equal length')
        res = ""
        for i in range(len(self.str_bit)):
            bit = int(self.str_bit[i]) & int(otherBitList.str_bit[i])
            res += str(bit)
        return res

    def chunk(self, chunk_length):
        if len(self.str_bit) % chunk_length != 0:
            raise ChunkError
        res = []
        for i in range(len(self.str_bit)//chunk_length):
            temp = []
            for j in range(chunk_length):
                temp.append(int(self.str_bit[i*chunk_length+j]))
            res.append(temp)
        return res

    def decode(self, encoding='utf-8'):
        if encoding != 'utf-8' and encoding != 'us-ascii':
            raise ValueError("Encoding is not supported")
        if encoding == 'utf-8':
            res = ""
            lst_utf8 = self.chunk(8)
            while len(lst_utf8) != 0:
                temp = lst_utf8.pop(0)
                if temp[0] == 0:
                    string_ints = [str(int) for int in temp]
                    str_of_ints = "".join(string_ints)
                    res += chr(int(str_of_ints, 2))
                else:
                    num_byte = 0
                    str_binary = ""
                    for i in range(8):
                        if temp[i] == 1:
                            num_byte += 1
                        if temp[i] == 0:
                            break
                    leading_byte_remain = temp[i+1:]
                    string_ints = [str(int) for int in leading_byte_remain]
                    str_of_ints = "".join(string_ints)
                    str_binary += str_of_ints
                    if num_byte - 1 == 0:
                        raise DecodeError("Invalid leading byte")
                    else:
                        for j in range(num_byte-1):
                            continuation_byte_remain = lst_utf8.pop(0)
                            string_ints = [str(int) for int in continuation_byte_remain]
                            str_of_ints = "".join(string_ints)
                            if str_of_ints[:2] != "10":
                                raise DecodeError("Invalid continuation byte")
                            str_binary += str_of_ints[2:]
                    res += chr(int(str_binary, 2))
        else:
            byte_lst = self.chunk(7)
            res = ""
            for i in range(len(byte_lst)):
                temp_res_ord = 0
                for j in range(7):
                    temp_res_ord += byte_lst[i][6-j] * (2 ** j)
                res += chr(temp_res_ord)
        return res

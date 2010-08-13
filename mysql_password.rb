#
# Calculate MySQL old_password()
#
# see http://illicium.tumblr.com/post/40334811/mysql-hashing-in-python
# for original python version
#
def old_password(string)
    nr = 1345345333
    nr2 = 0x12345671
    add = 7

    string.each_char do |char|
        if (char == ' ' or char == '\t')
          next
        end
        tmp = char.ord
        nr ^= (((nr & 63) + add) * tmp) + (nr << 8)
        nr2 += (nr2 << 8) ^ nr
        add += tmp
    end

    res1 = nr & 0x7fffffff
    res2 = nr2 & 0x7fffffff

    return '%08x%08x' % [res1, res2]
end

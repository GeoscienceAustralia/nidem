#!/bin/bash

# Very high memory and long wall time polygons, mem=64GB, walltime=48:00:00, jobfs=2GB
for polygon in 8 178 220 282 301

# Low memory polygons, mem=16GB, walltime=1:00:00, jobfs=2GB
# for polygon in 1 2 3 4 5 6 7 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 \
#                31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 \
#                58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 \
#                85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 \
#                109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 \
#                129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 \
#                149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 \
#                169 170 171 172 173 174 175 176 177 179 180 181 182 183 184 185 186 187 188 189 \
#                190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 \
#                210 211 212 213 214 215 216 217 218 219 221 222 223 224 225 226 227 228 229 230 \
#                231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 \
#                251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 \
#                271 272 273 274 275 276 277 278 279 280 281 283 284 285 286 287 288 289 290 291 \
#                292 293 294 295 296 297 298 299 300 302 303 304 305 306

# Validation polygon test, mem=8GB, walltime=0:45:00, jobfs=1GB
# for polygon in 48 269 143 39 256 300 136 33 78 139 152

do

    PBS="#!/bin/bash\n\
    #PBS -N NIDEM_${polygon}\n\
    #PBS -o PBS_output/NIDEM_${polygon}.out\n\
    #PBS -e PBS_output/NIDEM_${polygon}.err\n\
    #PBS -P r78\n\
    #PBS -q express\n\
    #PBS -l walltime=24:00:00\n\
    #PBS -l mem=64GB\n\
    #PBS -l jobfs=2GB\n\
    #PBS -l ncpus=1\n\
    #PBS -l wd\n\
    module use /g/data/v10/public/modules/modulefiles\n\
    module load dea\n\
    module load otps\n\
    python /g/data/r78/rt1527/nidem/NIDEM_generation.py $polygon"

    echo -e ${PBS} | qsub
    sleep 0.2
    echo "Submitting NIDEM polygon $polygon"

done

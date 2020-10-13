//
//  Language.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

// swiftlint:disable identifier_name
// swiftlint:disable file_length
import Foundation

public extension String {
    var isISO3166_1Alpha2: Bool {
        if count != 2 { return false }
        return Language(value: self) != nil
    }
}

public enum Language: String, CustomStringConvertible {
    case ad, ae, af, ag, ai, al, am, ao, aq, ar, `as`, at, au, aw, ax, az,
    ba, bb, bd, be, bf, bg, bh, bi, bj, bl, bm, bn, bo, bq, br, bs, bt, bv, bw, by, bz,
    ca, cc, cd, cf, cg, ch, ci, ck, cl, cm, cn, co, cr, cu, cv, cw, cx, cy, cz,
    de, dj, dk, dm, `do`, dz,
    ec, ee, eg, eh, er, es, et, fi, fj, fk, fm, fo, fr,
    ga, gb, gd, ge, gf, gg, gh, gi, gl, gm, gn, gp, gq, gr, gs, gt, gu, gw, gy,
    hk, hm, hn, hr, ht, hu,
    id, ie, il, im, `in`, io, iq, ir, `is`, it,
    je, jm, jo, jp,
    ke, kg, kh, ki, km, kn, kp, kr, kw, ky, kz,
    la, lb, lc, li, lk, lr, ls, lt, lu, lv, ly,
    ma, mc, md, me, mf, mg, mh, mk, ml, mm, mn, mo, mp, mq, mr, ms, mt, mu, mv, mw, mx, my, mz,
    na, nc, ne, nf, ng, ni, nl, no, np, nr, nu, nz,
    om,
    pa, pe, pf, pg, ph, pk, pl, pm, pn, pr, ps, pt, pw, py,
    qa,
    re, ro, rs, ru, rw,
    sa, sb, sc, sd, se, sg, sh, si, sj, sk, sl, sm, sn, so, sr, ss, st, sv, sx, sy, sz,
    tc, td, tf, tg, th, tj, tk, tl, tm, tn, to, tr, tt, tv, tw, tz,
    ua, ug, um, us, uy, uz,
    va, vc, ve, vg, vi, vn, vu,
    wf, ws,
    ye, yt,
    za, zm, zw

    /** The initializer */
    public init?(value: String) {
        self.init(rawValue: value.lowercased())
    }

    public init?(countryName name: String) {
        let allCodes = Language.knowCodes
        let allISO = allCodes.compactMap({ Language(rawValue: $0) })
        let names = allISO.map({ $0.countryName })
        if let idx = names.firstIndex(of: name) {
            self = allISO[idx]
        } else {
            return nil
        }
    }

    /** Provides a list of all known 2 digit country codes. */
    public static var knowCodes: [String] {
        var knownCodes = [String]()
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        for value1 in alphabet {
            for value2 in alphabet {
                let code = String(value1) + String(value2)
                if Language(rawValue: code) != nil {
                    knownCodes.append(code)
                }
            }
        }
        return knownCodes
    }

    /** The country name */
    public var countryName: String {
        return description
    }

    public var description: String {
        switch self {
        case .ad:   return "Andorra"
        case .ae:   return "United Arab Emirates"
        case .af:   return "Afghanistan"
        case .ag:   return "Antigua and Barbuda"
        case .ai:   return "Anguilla"
        case .al:   return "Albania"
        case .am:   return "Armenia"
        case .ao:   return "Angola"
        case .aq:   return "Antarctica"
        case .ar:   return "Argentina"
        case .`as`: return "American Samoa"
        case .at:   return "Austria"
        case .au:   return "Australia"
        case .aw:   return "Aruba"
        case .ax:   return "Åland Islands"
        case .az:   return "Azerbaijan"
        case .ba:   return "Bosnia and Herzegovina"
        case .bb:   return "Barbados"
        case .bd:   return "Bangladesh"
        case .be:   return "Belgium"
        case .bf:   return "Burkina Faso"
        case .bg:   return "Bulgaria"
        case .bh:   return "Bahrain"
        case .bi:   return "Burundi"
        case .bj:   return "Benin"
        case .bl:   return "Saint Barthélemy"
        case .bm:   return "Bermuda"
        case .bn:   return "Brunei Darussalam"
        case .bo:   return "Bolivia Plurinational State of"
        case .bq:   return "Bonaire Sint Eustatius and Saba"
        case .br:   return "Brazil"
        case .bs:   return "Bahamas"
        case .bt:   return "Bhutan"
        case .bv:   return "Bouvet Island"
        case .bw:   return "Botswana"
        case .by:   return "Belarus"
        case .bz:   return "Belize"
        case .ca:   return "Canada"
        case .cc:   return "Cocos (Keeling) Islands"
        case .cd:   return "Congo the Democratic Republic of the"
        case .cf:   return "Central African Republic"
        case .cg:   return "Congo"
        case .ch:   return "Switzerland"
        case .ci:   return "Côte d'Ivoire"
        case .ck:   return "Cook Islands"
        case .cl:   return "Chile"
        case .cm:   return "Cameroon"
        case .cn:   return "China"
        case .co:   return "Colombia"
        case .cr:   return "Costa Rica"
        case .cu:   return "Cuba"
        case .cv:   return "Cabo Verde"
        case .cw:   return "Curaçao"
        case .cx:   return "Christmas Island"
        case .cy:   return "Cyprus"
        case .cz:   return "Czech Republic"
        case .de:   return "Germany"
        case .dj:   return "Djibouti"
        case .dk:   return "Denmark"
        case .dm:   return "Dominica"
        case .`do`: return "Dominican Republic"
        case .dz:   return "Algeria"
        case .ec:   return "Ecuador"
        case .ee:   return "Estonia"
        case .eg:   return "Egypt"
        case .eh:   return "Western Sahara"
        case .er:   return "Eritrea"
        case .es:   return "Spain"
        case .et:   return "Ethiopia"
        case .fi:   return "Finland"
        case .fj:   return "Fiji"
        case .fk:   return "Falkland Islands (Malvinas)"
        case .fm:   return "Micronesia Federated States of"
        case .fo:   return "Faroe Islands"
        case .fr:   return "France"
        case .ga:   return "Gabon"
        case .gb:   return "United Kingdom of Great Britain and Northern Ireland"
        case .gd:   return "Grenada"
        case .ge:   return "Georgia"
        case .gf:   return "French Guiana"
        case .gg:   return "Guernsey"
        case .gh:   return "Ghana"
        case .gi:   return "Gibraltar"
        case .gl:   return "Greenland"
        case .gm:   return "Gambia"
        case .gn:   return "Guinea"
        case .gp:   return "Guadeloupe"
        case .gq:   return "Equatorial Guinea"
        case .gr:   return "Greece"
        case .gs:   return "South Georgia and the South Sandwich Islands"
        case .gt:   return "Guatemala"
        case .gu:   return "Guam"
        case .gw:   return "Guinea-Bissau"
        case .gy:   return "Guyana"
        case .hk:   return "Hong Kong"
        case .hm:   return "Heard Island and McDonald Islands"
        case .hn:   return "Honduras"
        case .hr:   return "Croatia"
        case .ht:   return "Haiti"
        case .hu:   return "Hungary"
        case .id:   return "Indonesia"
        case .ie:   return "Ireland"
        case .il:   return "Israel"
        case .im:   return "Isle of Man"
        case .in:   return "India"
        case .io:   return "British Indian Ocean Territory"
        case .iq:   return "Iraq"
        case .ir:   return "Iran Islamic Republic of"
        case .`is`:   return "Iceland"
        case .it:   return "Italy"
        case .je:   return "Jersey"
        case .jm:   return "Jamaica"
        case .jo:   return "Jordan"
        case .jp:   return "Japan"
        case .ke:   return "Kenya"
        case .kg:   return "Kyrgyzstan"
        case .kh:   return "Cambodia"
        case .ki:   return "Kiribati"
        case .km:   return "Comoros"
        case .kn:   return "Saint Kitts and Nevis"
        case .kp:   return "Korea Democratic People's Republic of"
        case .kr:   return "Korea Republic of"
        case .kw:   return "Kuwait"
        case .ky:   return "Cayman Islands"
        case .kz:   return "Kazakhstan"
        case .la:   return "Lao People's Democratic Republic"
        case .lb:   return "Lebanon"
        case .lc:   return "Saint Lucia"
        case .li:   return "Liechtenstein"
        case .lk:   return "Sri Lanka"
        case .lr:   return "Liberia"
        case .ls:   return "Lesotho"
        case .lt:   return "Lithuania"
        case .lu:   return "Luxembourg"
        case .lv:   return "Latvia"
        case .ly:   return "Libya"
        case .ma:   return "Morocco"
        case .mc:   return "Monaco"
        case .md:   return "Moldova Republic of"
        case .me:   return "Montenegro"
        case .mf:   return "Saint Martin (French part)"
        case .mg:   return "Madagascar"
        case .mh:   return "Marshall Islands"
        case .mk:   return "Macedonia the former Yugoslav Republic of"
        case .ml:   return "Mali"
        case .mm:   return "Myanmar"
        case .mn:   return "Mongolia"
        case .mo:   return "Macao"
        case .mp:   return "Northern Mariana Islands"
        case .mq:   return "Martinique"
        case .mr:   return "Mauritania"
        case .ms:   return "Montserrat"
        case .mt:   return "Malta"
        case .mu:   return "Mauritius"
        case .mv:   return "Maldives"
        case .mw:   return "Malawi"
        case .mx:   return "Mexico"
        case .my:   return "Malaysia"
        case .mz:   return "Mozambique"
        case .na:   return "Namibia"
        case .nc:   return "New Caledonia"
        case .ne:   return "Niger"
        case .nf:   return "Norfolk Island"
        case .ng:   return "Nigeria"
        case .ni:   return "Nicaragua"
        case .nl:   return "Netherlands"
        case .no:   return "Norway"
        case .np:   return "Nepal"
        case .nr:   return "Nauru"
        case .nu:   return "Niue"
        case .nz:   return "New Zealand"
        case .om:   return "Oman"
        case .pa:   return "Panama"
        case .pe:   return "Peru"
        case .pf:   return "French Polynesia"
        case .pg:   return "Papua New Guinea"
        case .ph:   return "Philippines"
        case .pk:   return "Pakistan"
        case .pl:   return "Poland"
        case .pm:   return "Saint Pierre and Miquelon"
        case .pn:   return "Pitcairn"
        case .pr:   return "Puerto Rico"
        case .ps:   return "Palestine State of"
        case .pt:   return "Portugal"
        case .pw:   return "Palau"
        case .py:   return "Paraguay"
        case .qa:   return "Qatar"
        case .re:   return "Réunion"
        case .ro:   return "Romania"
        case .rs:   return "Serbia"
        case .ru:   return "Russian Federation"
        case .rw:   return "Rwanda"
        case .sa:   return "Saudi Arabia"
        case .sb:   return "Solomon Islands"
        case .sc:   return "Seychelles"
        case .sd:   return "Sudan"
        case .se:   return "Sweden"
        case .sg:   return "Singapore"
        case .sh:   return "Saint Helena Ascension and Tristan da Cunha"
        case .si:   return "Slovenia"
        case .sj:   return "Svalbard and Jan Mayen"
        case .sk:   return "Slovakia"
        case .sl:   return "Sierra Leone"
        case .sm:   return "San Marino"
        case .sn:   return "Senegal"
        case .so:   return "Somalia"
        case .sr:   return "Suriname"
        case .ss:   return "South Sudan"
        case .st:   return "Sao Tome and Principe"
        case .sv:   return "El Salvador"
        case .sx:   return "Sint Maarten (Dutch part)"
        case .sy:   return "Syrian Arab Republic"
        case .sz:   return "Swaziland"
        case .tc:   return "Turks and Caicos Islands"
        case .td:   return "Chad"
        case .tf:   return "French Southern Territories"
        case .tg:   return "Togo"
        case .th:   return "Thailand"
        case .tj:   return "Tajikistan"
        case .tk:   return "Tokelau"
        case .tl:   return "Timor-Leste"
        case .tm:   return "Turkmenistan"
        case .tn:   return "Tunisia"
        case .to:   return "Tonga"
        case .tr:   return "Turkey"
        case .tt:   return "Trinidad and Tobago"
        case .tv:   return "Tuvalu"
        case .tw:   return "Taiwan Province of China"
        case .tz:   return "Tanzania United Republic of"
        case .ua:   return "Ukraine"
        case .ug:   return "Uganda"
        case .um:   return "United States Minor Outlying Islands"
        case .us:   return "United States of America"
        case .uy:   return "Uruguay"
        case .uz:   return "Uzbekistan"
        case .va:   return "Holy See"
        case .vc:   return "Saint Vincent and the Grenadines"
        case .ve:   return "Venezuela Bolivarian Republic of"
        case .vg:   return "Virgin Islands British"
        case .vi:   return "Virgin Islands U.S."
        case .vn:   return "Viet Nam"
        case .vu:   return "Vanuatu"
        case .wf:   return "Wallis and Futuna"
        case .ws:   return "Samoa"
        case .ye:   return "Yemen"
        case .yt:   return "Mayotte"
        case .za:   return "South Africa"
        case .zm:   return "Zambia"
        case .zw:   return "Zimbabwe"
        }
    }
}

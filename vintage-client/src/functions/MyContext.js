import React, { createContext, useState } from "react";

export const ContextSystem = createContext();

export default function MyContext({ children }) {
    const [header, setHeader] = useState({
        isHeaderExtend: false,
        isManShow: false,
        isWomenShow: false,
        isAccShow: false,
        isComShow: false,
        isHeaderHide: false
    });

    const [category, setCategory] = useState({
        category1: "",
        category2: "",
        category3: "",
        sort: "new"
    });

    const [isLogin, setIsLogin] = useState(
        localStorage.getItem('isLogin') === null || localStorage.getItem('isLogin') === 'false'
            ? false
            : true);

    const value = {
        get: {
            header: header,
            category: category,
            isLogin: isLogin
        },
        set: {
            setHeader: setHeader,
            setCategory: setCategory,
            setIsLogin: setIsLogin
        }
    };

    return (
        <div id="ContextAPI">
            <ContextSystem.Provider value={value}>
                {children}
            </ContextSystem.Provider>
        </div>
    )
}
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout'
import { Head } from '@inertiajs/react'
import { useEffect, useState } from 'react'
import axios from 'axios'
import DatePicker from 'react-datepicker'
import 'react-datepicker/dist/react-datepicker.css'
import {
    Accordion,
    AccordionHeader,
    AccordionBody,
} from "@material-tailwind/react";

export default function Dashboard ({ auth }) {

    const [feedData, setFeedData] = useState([])
    const [filteredData, setFilteredData] = useState([])
    const [oldFilteredData, setOldFilteredData] = useState([])
    const [categories, setCategories] = useState([])
    const [initCategories, setInitCategories] = useState([]);
    const [authors, setAuthors] = useState([])
    const [initAuthors, setInitAuthors] = useState([]);
    const [sources, setSources] = useState([])
    const [initSources, setInitSources] = useState([]);
    const [startDate, setStartDate] = useState(new Date());
    const [endDate, setEndDate] = useState(new Date());
    const [open, setOpen] = useState(1);
    const handleOpen = (value) => setOpen(open === value ? 0 : value);


    const initialState = axios.get('getall')
        .then(function (response) {
            return response['data']
        })

    const initialUserState = axios.get('getalluser')
        .then(function (response) {
            return response
        })

    useEffect(() => {
        const loadData = async () => {
            return await initialState;
        }
        const loadUserData = async () => {
            return await initialUserState;
        }
        loadUserData().then((result)=>{
            result = result['data'];
            if (result['sources']!=[])
            {
                setSources(result['sources']);
            }
            else
            {
                changeSources(['all'])
            }
            if (result['categories']!=[])
            {
                setCategories(result['categories'])
            }
            else
            {
                changeCategories(['all'])
            }
            if (result['authors']!=[])
            {
                setAuthors(result['authors'])
            }
            else
            {
                changeAuthors(['all'])
            }




        })
        loadData().then((result)=>{
            result.sort(function(a,b){
                return new Date(b['date']) - new Date(a['date']);
            });

            setFeedData(result)
            setFilteredData(result)
            let initialCategories = [];
            let initialAuthors = [];
            let initialSources = [];
            result.forEach(res=>{
                if (!initialCategories.includes(res['category']))
                {
                    initialCategories.push(res['category']);
                }
                if (!initialAuthors.includes(res['author']))
                {
                    initialAuthors.push(res['author']);
                }
                if (!initialSources.includes(res['source']))
                {
                    initialSources.push(res['source']);
                }
            })
            setInitAuthors(initialAuthors);
            setInitCategories(initialCategories);
            setInitSources(initialSources);
        })
    },[])

    function changeCategories (categoriesP) {
        if (categoriesP[0]==='all')
        {
            setCategories([]);
        }
        else
        {
            let categoriesUpdated = !categories.includes(categoriesP[0])?categoriesP.concat(categories):categories.filter(e => e !== categoriesP[0]);
            setCategories(categoriesUpdated)
        }

    }

    function isMatch(searchOnString, searchText) {
        searchText = searchText.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
        return searchOnString.match(new RegExp("\\b"+searchText+"\\b", "i")) != null;
    }

    function changeAuthors (authorsP) {
        if (authorsP[0]==='all')
        {
            setAuthors([]);
        }
        else
        {
            let authorsUpdated = !authors.includes(authorsP[0])?authorsP.concat(authors):authors.filter(e => e !== authorsP[0]);
            setAuthors(authorsUpdated)
        }

    }

    function changeSources (sourcesP) {

        if (sourcesP[0]==='all')
        {
            setSources([]);
        }
        else
        {
            let sourcesUpdated = !sources.includes(sourcesP[0])?sourcesP.concat(sources):sources.filter(e => e !== sourcesP[0]);
            setSources(sourcesUpdated)
        }

    }

    useEffect(()=>{
        let newData = [];

        feedData.forEach(data => {
            if (sources.includes(data['source']) || categories.includes(data['category']) || authors.includes(data['author']))
            {
                newData.push(data);
            }
        })
        if (newData.length===0)
        {
            newData = feedData;
        }
        setFilteredData(newData);
        setOldFilteredData(newData);
    },[categories,sources,authors])

    const handleKeywordChange = (event) => {
        if (event.target.value.length===0)
        {
            setFilteredData(oldFilteredData);
        }
        else
        {
            let keywordFilter = oldFilteredData.filter(data => {

                if(data['content']!=null?isMatch(data['content'],event.target.value):false)
                {
                    return data['content'];
                }
            })
            setFilteredData(keywordFilter);
        }
    };

    const startDateChange = (date) => {
        setStartDate(date)
    }
    const endDateChange = (date) => {
        setEndDate(date)
    }

    useEffect(()=>{
        let dateFilter = filteredData.filter(data => {
            if(new Date(data['date'])<=new Date(endDate) && new Date(data['date'])>=new Date(startDate))
            {
                return data;
            }
        })
        setFilteredData(dateFilter);
    },[startDate,endDate])


    function Icon({ id, open }) {
        return (
            <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                strokeWidth={2}
                stroke="currentColor"
                className={`${id === open ? "rotate-180" : ""} h-5 w-5 transition-transform`}
            >
                <path strokeLinecap="round" strokeLinejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
            </svg>
        );
    }

    return (

        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">News</h2>}
        >
            <Head title="Dashboard"/>

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div className="mb-4">
                        <Accordion open={open === 0} icon={<Icon id={1} open={open} />}>
                            <AccordionHeader onClick={() => handleOpen(1)}>Filters</AccordionHeader>
                            <AccordionBody>
                                <h3 className="text-lg">CATEGORIES</h3>
                                <button
                                    key="all"
                                    className="relative z-0 rounded-md bg-blue-300 px-3 py-1.5 m-2 font-medium text-gray-600"
                                    onClick={() => {changeCategories(['all'])}}>RESET</button>
                                {

                                    initCategories.map((data, index)=>{
                                        let color = categories.includes(data)?"bg-green-300 ":"bg-white ";
                                        return (
                                            <button
                                                key={index}
                                                className={"relative z-0 rounded-full "+color+"px-3 py-1.5 m-2 font-medium text-gray-600 hover:bg-green-200 "}
                                                onClick={() => {changeCategories([data])}}>{data === '' ?
                                                <span
                                                    className="text-red-600">No Category</span> : data}</button>
                                        );
                                    })
                                }
                                <h3 className="text-lg mt-4">AUTHORS</h3>
                                <button
                                    key="allAuthors"
                                    className="relative z-0 rounded-md bg-blue-300 px-3 py-1.5 m-2 font-medium text-gray-600"
                                    onClick={() => {changeAuthors(['all'])}}>RESET</button>
                                {

                                    initAuthors.map((data, index)=>{
                                        let color = authors.includes(data)?"bg-green-300 ":"bg-white ";
                                        return (
                                            <button
                                                key={index}
                                                className={"relative z-0 rounded-full "+color+"px-3 py-1.5 m-2 font-medium text-gray-600 hover:bg-green-200 "}
                                                onClick={() => {changeAuthors([data])}}>{data === '' ?
                                                <span
                                                    className="text-red-600">NO AUTHOR SPECIFIED</span> : data}</button>
                                        );
                                    })
                                }
                                <h3 className="text-lg mt-4">SOURCES</h3>
                                <button
                                    key="allSources"
                                    className="relative z-0 rounded-md bg-blue-300 px-3 py-1.5 m-2 font-medium text-gray-600"
                                    onClick={() => {changeSources(['all'])}}>RESET</button>
                                {
                                    initSources.map((data, index)=>{
                                        let color = sources.includes(data)?"bg-green-300 ":"bg-white ";
                                        return (
                                            <button
                                                key={index}
                                                className={"relative z-0 rounded-full "+color+"px-3 py-1.5 m-2 font-medium text-gray-600 hover:bg-green-200 "}
                                                onClick={() => {changeSources([data])}}>{data}</button>
                                        );
                                    })
                                }
                                <h3 className="text-lg mt-4">SEARCH</h3>
                                <input id="name" required="" autoComplete="name" type="text"
                                       className="border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm mt-1 block w-full"
                                       placeholder="KEYWORD"
                                       onChange={handleKeywordChange}
                                />
                                <div className="mb-4 mt-4 text-right">
                                    <div className="mb-4">
                                        <span className="ml-2 mr-2">Start Date : </span>
                                        <DatePicker
                                            selected={startDate}
                                            onChange={(date) => startDateChange(date)}
                                            showTimeSelect
                                            timeFormat="HH:mm"
                                            timeIntervals={15}
                                            timeCaption="time"
                                            dateFormat="yyyy-MM-dd HH:mm:ss"
                                        />
                                    </div>
                                    <div>
                                        <span className="ml-2 mr-2">End Date : </span>
                                        <DatePicker
                                            selected={endDate}
                                            onChange={(date) => endDateChange(date)}
                                            showTimeSelect
                                            timeFormat="HH:mm"
                                            timeIntervals={15}
                                            timeCaption="time"
                                            dateFormat="yyyy-MM-dd HH:mm:ss"
                                        />
                                    </div>
                                </div>
                            </AccordionBody>
                        </Accordion>
                    </div>

                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 text-gray-900 flex-1 gap-x-4 flex-wrap items-center flex-row justify-center">
                            {
                                filteredData.map((data, index) => {
                                    return (
                                        <article key={index}
                                                 className="flex flex-col items-start justify-between border-b grow pb-3 pt-3">
                                            <div className="flex items-center gap-x-4 text-xs">
                                                <time dateTime={data['date']}
                                                      className="text-gray-500">{data['date']}</time>
                                                <button
                                                    className="relative z-0 rounded-full bg-gray-50 px-3 py-1.5 font-medium text-gray-600"
                                                    onClick={() => {changeCategories([data['category']])}}>{data['category'] === '' ?
                                                    <span
                                                        className="text-red-600">No Category</span> : data['category']}</button>
                                            </div>
                                            <div className="group relative">
                                                <h3 className="mt-3 text-lg font-semibold leading-6 text-gray-900 group-hover:text-gray-600">
                                                    <a href={data['url']} target="_blank">
                                                        <span className="absolute inset-0"></span>
                                                        {data['title']}
                                                    </a>
                                                </h3>
                                                <p className="mt-5 line-clamp-3 text-sm leading-6 text-gray-600">{data['content']}</p>
                                            </div>
                                            <div className="relative mt-8 flex items-center gap-x-4">
                                                <div className="text-sm leading-6">
                                                    <p className="font-semibold text-gray-900">
                                                        <span>
                                                            <span className="absolute inset-0"></span>
                                                            {data['author'] === '' ? <span
                                                                className="text-red-600">NO AUTHOR SPECIFIED</span> : data['author']} - <span
                                                            className="text-gray-500 text-xs"> {data['source']} </span>
                                                        </span>
                                                    </p>
                                                </div>
                                            </div>
                                        </article>
                                    )
                                })
                            }
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    )
}

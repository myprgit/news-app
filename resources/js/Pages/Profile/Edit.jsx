import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout'
import DeleteUserForm from './Partials/DeleteUserForm'
import UpdatePasswordForm from './Partials/UpdatePasswordForm'
import UpdateProfileInformationForm from './Partials/UpdateProfileInformationForm'
import { Select, Option } from '@material-tailwind/react'
import { Head } from '@inertiajs/react'
import axios from 'axios'
import { useEffect, useState } from 'react'
import DangerButton from '@/Components/DangerButton.jsx'
import PrimaryButton from '@/Components/PrimaryButton.jsx'

export default function Edit ({ auth, mustVerifyEmail, status }) {

    const [authors, setAuthors] = useState([])
    const [categories, setCategories] = useState([])
    const [sources, setSources] = useState([])
    const [selectedAuthors, setSelectedAuthors] = useState([])
    const [selectedSources, setSelectedSources] = useState([])
    const [selectedCategories, setSelectedCategories] = useState([])
    const [isSaved, setIsSaved] = useState(0);

    const initialState = axios.get('getall')
        .then(function (response) {
            return response['data']
        })

    const userPrefs = axios.get('getprefs')
        .then(function (response) {
            return response['data']
        })

    const authorChange = (e) => {
        setSelectedAuthors((prevState) => [...prevState, e])
    }
    const sourceChange = (e) => {
        setSelectedSources((prevState) => [...prevState, e])
    }
    const categoryChange = (e) => {
        setSelectedCategories((prevState) => [...prevState, e])
    }


    async function savePrefs()
    {
        return await axios.post('updateprefs', {
            authors: selectedAuthors,
            categories: selectedCategories,
            sources: selectedSources
        }).then(function (response) {
            setIsSaved(1);
            return response['data']
        })

    }

    useEffect(() => {
        const loadData = async () => {
            return await initialState
        }
        const loadPrefs = async () => {
            return await userPrefs
        }
        loadData().then((result) => {
            result.sort(function (a, b) {
                return new Date(b['date']) - new Date(a['date'])
            })

            setAuthors([...new Set(result.map((data) => {
                return data['author']
            }))])
            setCategories([...new Set(result.map((data) => {
                return data['category']
            }))])
            setSources([...new Set(result.map((data) => {
                return data['source']
            }))])
        })
        loadPrefs().then((result) => {
            setSelectedAuthors([...new Set(result['authors'].map((data) => {
                return data['author']
            }))])
            setSelectedCategories([...new Set(result['categories'].map((data) => {
                return data['category']
            }))])
            setSelectedSources([...new Set(result['sources'].map((data) => {
                return data['source']
            }))])
        })
    }, [])

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">Profile</h2>}
        >
            <Head title="Profile"/>

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
                    <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
                        <UpdateProfileInformationForm
                            mustVerifyEmail={mustVerifyEmail}
                            status={status}
                            className="max-w-xl"
                        />
                    </div>
                    <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
                        <UpdatePasswordForm className="max-w-xl"/>
                    </div>
                    <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
                        <h2 className="text-lg font-medium text-gray-900">Preferences</h2>

                        <div className="flex gap-6">
                            <div className="w-72 flex-1">
                                <Select label="Authors" onChange={authorChange}>
                                    {authors.map((data, index) => {
                                        return (
                                            <Option key={index}
                                                    value={data}>{data === '' ? 'NO AUTHORS SPECIFIED' : data}</Option>
                                        )
                                    })}
                                </Select>

                                {selectedAuthors.map((data, index) => {
                                    return <div className="flex justify-between mt-3 mb-4" key={index}>
                                        <span>{data === '' ? 'NO AUTHORS SPECIFIED' : data}</span><span><DangerButton
                                        onClick={() => {setSelectedAuthors((prevState) => prevState.filter(item => item !== data))}}
                                        className="ml-3">
                            X
                        </DangerButton></span></div>
                                })}

                            </div>
                            <div className="w-72 flex-1">

                                <Select label="Sources" onChange={sourceChange}>
                                    {sources.map((data, index) => {
                                        return (
                                            <Option key={index} value={data}>{data}</Option>
                                        )
                                    })}
                                </Select>
                                {selectedSources.map((data, index) => {
                                    return <div className="flex justify-between mt-3 mb-4" key={index}>
                                        <span>{data}</span><span><DangerButton
                                        onClick={() => {setSelectedSources((prevState) => prevState.filter(item => item !== data))}}
                                        className="ml-3">
                            X
                        </DangerButton></span></div>
                                })}
                            </div>
                            <div className="w-72 flex-1">
                                <Select label="Categories" onChange={categoryChange}>
                                    {categories.map((data, index) => {
                                        return (
                                            <Option key={index}
                                                    value={data}>{data === '' ? 'No Category' : data}</Option>
                                        )
                                    })}
                                </Select>

                                {selectedCategories.map((data, index) => {
                                    return <div className="flex justify-between mt-3 mb-4" key={index}>
                                        <span>{data === '' ? 'No Category' : data}</span><span><DangerButton
                                        onClick={() => {setSelectedCategories((prevState) => prevState.filter(item => item !== data))}}
                                        className="ml-3">
                            X
                        </DangerButton></span></div>
                                })}
                            </div>

                        </div>
                        <div className="mt-6">
                            <PrimaryButton onClick={savePrefs}>Save</PrimaryButton>
                            {isSaved?'Saved.':''}
                        </div>
                    </div>
                    <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
                        <DeleteUserForm className="max-w-xl"/>
                    </div>

                </div>
            </div>
        </AuthenticatedLayout>
    )
}
